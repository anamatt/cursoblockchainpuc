pragma solidity 0.5.12;

contract ConfissaoDeDivida {
    
    string public credor;
    string public devedor;
    string public objeto;
    int private valor;
    int private indiceReajuste;
    int private valorParcela;
    int private parcelamento;
    
    constructor (string memory nomeCredor, string memory nomeDevedor, string memory objetoDivida, int valorDivida, int numeroParcelas) public{
        credor = nomeCredor;
        devedor = nomeDevedor;
        valor = valorDivida;
            require (valor > 0, "Valor incorreto");
        objeto = objetoDivida;
        parcelamento = numeroParcelas;
            require (parcelamento < 24, "Parcelamento Inválido");
    }
    
    function ValorDoDebito() public view returns (int) {
        return valor;
    }
     
    function ValorDaParcela() public view returns (int) {
        return valorParcela;
    }

    function CalcularParcela (int parcelas) public returns (int) {
        parcelas = parcelamento;
        valorParcela = valor/parcelamento;
        return valorParcela;
    }
    
    function InserirReajusteAnual (int indiceIGPM) public returns (int) {
        if (indiceIGPM < 1) {
            indiceIGPM = 1;
        }
        int reajuste = 1;
        reajuste = (valorParcela*indiceIGPM);
        indiceReajuste = reajuste;
        valorParcela = reajuste;
        return valorParcela;
    }
    
    function aplicarMulta (int mesesRestantes, int percentual) public {
        require(mesesRestantes < parcelamento, "Cálculo inválido");
        require (percentual < 24, "Percentual inválido");
        for (int i=1; i<mesesRestantes; i++) {
            valor = ((valor+(valor/10))*percentual)/100;
        }
    }
    
}
