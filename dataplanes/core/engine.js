class DataplaneEngine {
    constructor(configPath) {
        this.configPath = configPath;
        this.config = null;
        this.currentStep = -1;
        this.isPlaying = false;
        this.speed = 1500; // Base speed em ms
        this.timer = null;
        this.runId = 0; // Token para cancelar animações ao resetar/pular

        this.ui = {
            title: document.getElementById('dataplane-title'),
            subtitle: document.getElementById('dataplane-subtitle'),
            statusBox: document.getElementById('status'),
            btnPlay: document.getElementById('btn-play'),
            btnNext: document.getElementById('btn-next'),
            btnPrev: document.getElementById('btn-prev'),
            cluster: document.getElementById('cluster')
        };
    }

    async init() {
        try {
            const response = await fetch(this.configPath);
            this.config = await response.json();
            this.renderUI();
            this.reset();
        } catch (error) {
            console.error("Erro ao carregar dataplane:", error);
            this.updateTerminal("<span style='color: #ef4444;'>[Erro] Falha ao carregar o arquivo de configuração.</span>", "var(--border-subtle)");
        }
    }

    renderUI() {
        if (!this.config) return;
        if (this.ui.title) this.ui.title.innerText = this.config.title;
        if (this.ui.subtitle) this.ui.subtitle.innerText = this.config.subtitle;

        // Renderiza Painéis Dinamicamente
        let html = '<div id="packet" class="packet"></div>';
        this.config.planes.forEach(plane => {
            html += `<div class="plane">
                <div class="plane-title">${plane.title}</div>`;
            plane.components.forEach(comp => {
                if (comp.nested && comp.nested.length > 0) {
                    html += `<div id="${comp.id}" class="component" style="text-align: left; padding-top: 10px;">
                        <span style="font-size: 11px; color: var(--text-muted); text-transform: uppercase;">${comp.label}</span>
                        <div class="nested-box">`;
                    comp.nested.forEach(sub => {
                        html += `<div id="${sub.id}" class="sub-component">${sub.label}</div>`;
                    });
                    html += `</div></div>`;
                } else {
                    html += `<div id="${comp.id}" class="component">${comp.label}</div>`;
                }
            });
            html += `</div>`;
        });
        
        this.ui.cluster.innerHTML = html;
        this.ui.packet = document.getElementById('packet');
    }

    setSpeed(ms) {
        this.speed = parseInt(ms);
    }

    updateTerminal(text, borderColor) {
        this.ui.statusBox.innerHTML = `<span class="prompt">silvestrini@debian:~#</span> ${text}`;
        this.ui.statusBox.style.borderLeftColor = borderColor;
    }

    updateControls() {
        if (!this.config) return;
        this.ui.btnPrev.disabled = this.currentStep <= 0 && !this.isPlaying;
        this.ui.btnNext.disabled = this.currentStep >= this.config.steps.length - 1;
        this.ui.btnPlay.innerHTML = this.isPlaying ? "⏸️ Pausar" : "▶️ Reproduzir";
        this.ui.btnPlay.className = this.isPlaying ? "" : "btn-primary";
    }

    cleanUI() {
        document.querySelectorAll('.component, .sub-component').forEach(el => {
            el.classList.remove('active-comp', 'active-success', 'pulse-source');
        });
        if (this.ui.packet) {
            this.ui.packet.style.opacity = '0';
            this.ui.packet.style.transitionDuration = '0ms';
        }
    }

    async movePacket(fromId, toId, currentRunId) {
        return new Promise(resolve => {
            const fromEl = document.getElementById(fromId);
            const toEl = document.getElementById(toId);
            if (!fromEl || !toEl) { resolve(); return; }

            const clusterRect = this.ui.cluster.getBoundingClientRect();
            const fromRect = fromEl.getBoundingClientRect();
            const toRect = toEl.getBoundingClientRect();

            // Calcula Coordenadas Relativas (Centros dos Elementos)
            const startX = (fromRect.left - clusterRect.left) + (fromRect.width / 2) - 7;
            const startY = (fromRect.top - clusterRect.top) + (fromRect.height / 2) - 7;
            
            const endX = (toRect.left - clusterRect.left) + (toRect.width / 2) - 7;
            const endY = (toRect.top - clusterRect.top) + (toRect.height / 2) - 7;

            // 1. Posiciona no Início e Torna Visível
            this.ui.packet.style.transitionDuration = '0ms';
            this.ui.packet.style.transform = `translate3d(${startX}px, ${startY}px, 0)`;
            this.ui.packet.style.opacity = '1';

            // Força o Browser a recalcular o layout (Reflow) antes da transição
            this.ui.packet.offsetHeight; 

            // 2. Anima até o Destino (Aceleração por Hardware via Translate3d)
            const animDuration = this.speed * 0.7;
            this.ui.packet.style.transitionDuration = `${animDuration}ms`;
            this.ui.packet.style.transform = `translate3d(${endX}px, ${endY}px, 0)`;

            // 3. Resolve a promessa quando a animação terminar
            setTimeout(() => {
                if (this.runId === currentRunId) {
                    this.ui.packet.style.opacity = '0';
                }
                resolve();
            }, animDuration);
        });
    }

    async executeStep(index) {
        if (!this.config || index < 0 || index >= this.config.steps.length) return;
        
        // Gera um ID único para esta execução. Se mudar, abortamos.
        const currentRunId = ++this.runId; 
        
        const step = this.config.steps[index];
        this.cleanUI();
        this.updateControls();

        // Destaca a origem sutilmente e atualiza o texto IMEDIATAMENTE para o usuário ler o que vai acontecer
        const sourceNode = document.getElementById(step.from);
        if (sourceNode) sourceNode.classList.add('pulse-source');
        
        const targetColor = step.success ? 'var(--emerald)' : 'var(--cyan)';
        this.updateTerminal(step.desc, targetColor);

        // Dispara a animação fluida da bolinha
        await this.movePacket(step.from, step.to, currentRunId);
        
        // Se o usuário clicou em Reset/Next/Prev enquanto animava, aborta aqui
        if (this.runId !== currentRunId) return;

        // Remove destaque da origem e acende intensamente o destino
        if (sourceNode) sourceNode.classList.remove('pulse-source');
        const targetNode = document.getElementById(step.active);
        if (targetNode) {
            targetNode.classList.add(step.success ? 'active-success' : 'active-comp');
        }
        
        if (index === this.config.steps.length - 1) {
            this.pause();
        }
    }

    async nextStep() {
        if (this.currentStep < this.config.steps.length - 1) {
            this.currentStep++;
            await this.executeStep(this.currentStep);
        }
    }

    async prevStep() {
        if (this.currentStep > 0) {
            this.currentStep--;
            await this.executeStep(this.currentStep);
        } else if (this.currentStep === 0) {
            this.reset();
        }
    }

    play() {
        if (this.currentStep >= this.config.steps.length - 1) {
            this.currentStep = -1; // Recomeça se estiver no final
        }
        this.isPlaying = true;
        this.updateControls();
        
        const loop = async () => {
            if (!this.isPlaying) return;
            
            const currentLoopId = this.runId; // Garante integridade do loop
            await this.nextStep();
            
            if (this.isPlaying && this.currentStep < this.config.steps.length - 1 && this.runId === currentLoopId + 1) {
                // Aguarda o tempo de leitura do texto antes de engatilhar o próximo
                this.timer = setTimeout(loop, this.speed * 0.5); 
            }
        };
        loop();
    }

    pause() {
        this.isPlaying = false;
        clearTimeout(this.timer);
        this.updateControls();
    }

    togglePlay() {
        this.isPlaying ? this.pause() : this.play();
    }

    reset() {
        this.runId++; // Cancela qualquer animação ou setTimeout ativo imediatamente
        this.pause();
        this.currentStep = -1;
        this.cleanUI();
        this.updateTerminal("Ambiente isolado carregado e pronto. Inicie a simulação.", "var(--border-subtle)");
        this.updateControls();
    }
}