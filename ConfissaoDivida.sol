pragma solidity 0.5.12;

contract ConfissaoDeDivida {
    
    string public credor;
    string public devedor;
    string public objeto;
    uint private valor;
    int private indiceReajuste;
    uint private valorParcela;
    uint private parcelamento;
    
    constructor (string memory nomeCredor, string memory nomeDevedor, string memory objetoDivida, uint valorDivida) public{
        credor = nomeCredor;
        devedor = nomeDevedor;
        valor = valorDivida;
        objeto = objetoDivida;
    }
    
    function ValorDoDebito() public view returns (uint) {
        return valor;
    }
    
    function ValorDaParcela() public view returns (uint) {
        return valorParcela;
    }
     
    function CalcularParcela (uint256 ParcelaOriginal) public view returns (uint) {
        ParcelaOriginal = valor/parcelamento;
        ParcelaOriginal = valorParcela;
        return valorParcela;
    }
        
    function InserirParcelamento (uint numeroParcelas) public returns (uint) {
        require(numeroParcelas < 25, "Número de parcelas indisponível");
        parcelamento = numeroParcelas;
        return parcelamento;
    }
    
    function InserirReajusteAnual (int indiceIGPM) public returns (int) {
        indiceIGPM = indiceReajuste;
        if (indiceReajuste < 0) {
            indiceReajuste = 0;
            return indiceReajuste;
        }
    }

}
