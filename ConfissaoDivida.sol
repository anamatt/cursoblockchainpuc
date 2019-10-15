pragma solidity 0.5.12;

contract ConfissaoDeDivida {
    
    string public credor;
    string public devedor;
    string public objeto;
    uint private valor;
    uint private indiceReajuste;
    uint private valorParcela;
    uint private parcelamento;    
    bool[] public confirmacaoPagamento;
    address payable public contaDeposito;
    
    constructor (string memory nomeCredor, string memory nomeDevedor, string memory objetoDivida, address payable contaCredor, uint valorDivida, uint numeroParcelas) public{
        require (valorDivida > 0, "Valor incorreto");
        require (numeroParcelas < 24, "Parcelamento Inválido");
        credor = nomeCredor;
        devedor = nomeDevedor;
        valor = valorDivida;
        objeto = objetoDivida;
        parcelamento = numeroParcelas;
        contaDeposito = contaCredor;
        valorParcela =valor/parcelamento;
    }
    
    function ValorDoDebito() public view returns (uint) {
        return valor;
    }
     
    function ValorDaParcela() public view returns (uint) {
        return valorParcela;
    }
    
    function InserirReajusteAnual (uint indiceIGPM) public returns (uint) {
        if (indiceIGPM < 10000) {
            indiceIGPM = 10000;
        }
        uint reajuste = 1;
        reajuste = (valorParcela+((valorParcela*indiceIGPM)/1000000));
        indiceReajuste = reajuste;
        valorParcela = reajuste;
        return valorParcela;
    }
    
    function aplicarMulta (uint mesesRestantes, uint percentual) public {
        require(mesesRestantes < parcelamento, "Cálculo inválido");
        require (percentual < 24, "Percentual inválido");
        for (uint i=1; i<mesesRestantes; i++) {
            valor = ((valor+(valor/10))*percentual)/100;
        }
    }
    
        function pagarParcela() public payable {
        require (msg.value>=valorParcela, "Valor de depósito insuficiente");
        contaDeposito.transfer(msg.value);
        confirmacaoPagamento.push(true);
        }
    
}
