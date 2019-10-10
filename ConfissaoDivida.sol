pragma solidity 0.5.12;

contract ConfissaoDeDivida {
    
    string public credor;
    string public devedor;
    string public objeto;
    uint private valor;
    uint private indiceReajuste;
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

    function CalcularParcela (uint parcelas) public {
        parcelas = parcelamento;
        parcelas = valor/parcelamento;
        valorParcela = parcelas;
    }
    
    function InserirReajusteAnual (uint indiceIGPM) public {
        if (indiceIGPM < 1) {
            indiceIGPM = 1;
        }
        uint reajuste = 1;
        reajuste = (valor*indiceIGPM);
        indiceReajuste = reajuste;
    }

}
