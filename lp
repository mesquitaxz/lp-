javascript
// Importa os módulos necessários
const express = require('express');
const bodyParser = require('body-parser');

// Cria uma instância do aplicativo Express
const app = express();

// Configura o middleware body-parser para processar JSON
app.use(bodyParser.json());

// Função para calcular o IMC
function calcularIMC(peso, altura) {
    // Calcula o IMC com duas casas decimais
    return Number((peso / (altura * altura)).toFixed(1));
}

// Rota para calcular o IMC
app.post('/calcular-imc', (req, res) => {
    try {
        // Extrai peso e altura do corpo da requisição
        const { peso, altura } = req.body;

        // Verifica se peso e altura são números válidos
        if (!peso || !altura || isNaN(peso) || isNaN(altura)) {
            return res.status(400).json({
                erro: 'Peso e altura devem ser números válidos'
            });
        }

        // Calcula o IMC
        const imc = calcularIMC(peso, altura);

        // Retorna o resultado
        res.json({ imc });

    } catch (error) {
        // Trata qualquer erro interno do servidor
        res.status(500).json({
            erro: 'Erro interno do servidor'
        });
    }
});

// Configura a porta do servidor
const PORT = process.env.PORT || 3000;

// Inicia o servidor
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
javascript
const express = require('express');
const app = express();
app.use(express.json());

function calcularIMC(peso, altura) {
    return Number((peso / (altura * altura)).toFixed(1));
}

app.post('/calcular-imc', (req, res) => {
    const { peso, altura } = req.body;
    const imc = calcularIMC(peso, altura);
    res.json({ imc });
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
