pragma solidity 0.5.12;

contract ConfissaoDeDivida {
    
    string public credor;
    string public devedor;
    string public objeto;
    uint private valor;
    int private indiceReajuste;
    uint private valorParcela;
    uint private parcelamento;
    
    constructor (string memory nomeCredor, string memory nomeDevedor, string memory objetoDivida, uint valorDivida, uint numeroParcelas) public{
        credor = nomeCredor;
        devedor = nomeDevedor;
        valor = valorDivida;
        objeto = objetoDivida;
        parcelamento = numeroParcelas;
    }
    
    function ValorDoDebito() public view returns (uint) {
        return valor;
    }
    
    function ValorDaParcela() public view returns (uint) {
        return valorParcela;
    }
     
    function CalcularParcela () public returns (uint) {
        valorParcela = valor/parcelamento;
        return valorParcela;
    }
    
    function InserirReajusteAnual (int indiceIGPM) public returns (int) {
        indiceIGPM = indiceReajuste;
        if (indiceReajuste < 1) {
            indiceReajuste = 1;
            return indiceReajuste;
        }
    }

}
