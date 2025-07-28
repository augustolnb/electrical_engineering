# Repositório de Scripts de Engenharia Elétrica

Este repositório é uma coleção de scripts e notebooks Jupyter focados em resolver problemas comuns da Engenharia Elétrica, com ênfase em Análise de Sistemas de Potência, métodos numéricos e projetos de infraestrutura elétrica.

## Estrutura do Diretório

Os arquivos estão organizados da seguinte forma para facilitar o acesso e a compreensão:

```
/eng-eletrica
├── notebooks/
│   ├── power_systems_analysis/
│   │   ├── asp_calculator.ipynb
│   │   ├── asp1.ipynb
│   │   └── asp2_newtons_method.ipynb
│   └── grounding_mesh/
│       ├── malha_aterramento-v01.ipynb
│       ├── malha_aterramento_v02.ipynb
│       └── malha_aterramento-v03.ipynb
│
├── matlab_octave_scripts/
│   ├── cart.m
│   ├── newton.m
│   ├── newton_desacoplado.m
│   ├── pol.m
│   └── z_paralelo.m
│
├── python_scripts/
│   └── rotating_fieldV2.py
│
├── .git/
├── LICENSE
└── README.md
```

## Descrição do Conteúdo

### 1. Jupyter Notebooks (`notebooks/`)

Esta seção contém análises interativas e cálculos complexos utilizando Python.

#### Análise de Sistemas de Potência (`power_systems_analysis/`)

*   `asp_calculator.ipynb`: Um calculador geral para diversas tarefas de análise de sistemas de potência.
*   `asp1.ipynb`: Notebook com estudos e exercícios introdutórios sobre o tema.
*   `asp2_newtons_method.ipynb`: Implementação detalhada do método de Newton-Raphson para solução de fluxo de potência, um problema fundamental em sistemas de potência.

#### Malha de Aterramento (`grounding_mesh/`)

*   `malha_aterramento-v01.ipynb` a `v03.ipynb`: Uma série de notebooks que mostram a evolução de um script para o cálculo e dimensionamento de malhas de aterramento, seguindo normas técnicas.

### 2. Scripts MATLAB/Octave (`matlab_octave_scripts/`)

Funções e scripts desenvolvidos para o ambiente MATLAB ou seu equivalente de código aberto, Octave.

*   `newton.m` & `newton_desacoplado.m`: Implementações do método numérico de Newton, com uma versão otimizada (desacoplado) para problemas de fluxo de potência.
*   `cart.m` & `pol.m`: Funções utilitárias para conversão entre coordenadas cartesianas (retangulares) e polares.
*   `z_paralelo.m`: Uma função simples para calcular a impedância equivalente de dois elementos em paralelo.

### 3. Scripts Python (`python_scripts/`)

*   `rotating_fieldV2.py`: Script em Python para simular e/ou visualizar um campo magnético girante, um conceito essencial para o entendimento de máquinas elétricas (motores e geradores).

## Como Utilizar

*   **Jupyter Notebooks**: Requerem um ambiente Python com Jupyter Notebook ou JupyterLab instalado. Bibliotecas comuns como `numpy`, `pandas` e `matplotlib` são provavelmente necessárias.
*   **Scripts MATLAB/Octave**: Podem ser executados em uma instalação do MATLAB ou GNU Octave.
*   **Scripts Python**: Podem ser executados com um interpretador Python.

## Licença

O conteúdo deste repositório está distribuído sob a licença especificada no arquivo `LICENSE`.
