pragma solidity 0.5.12;

//forma simples de escrever comentarios

contract Aluguel {
    
    string public locatario;
    string public locador;
    uint private valor;
    
/*
string = texto - deve ser usado entre aspas - ex. string "texto"
//uint = números inteiros
//adress = endereço ethereum (código)
//bool = verdadeiro ou falso
*/

    uint256 constant numeroMaximoLegalDeAlugueisParaMulta = 3;

    constructor (string memory nomeLocador, string memory nomeLocatario, uint256 valorDoAluguel)
/*para o constructor, utiliza-se o () para definir seus parâmetros*/
    public{
        locador = nomeLocador;
        locatario = nomeLocatario;
        valor = valorDoAluguel;
    }

//após a function, é necessário usar (), como forma de linguagem 
    function valorAtualDoAluguel() public view returns (uint) {
       return valor; 
    }
//esta função, por exemplo permite a terceiros a visualização do valor (função publica de ver o valor, que retorna para esta informação)

    function simulaMulta (uint mesesRestantes, uint totalMesesContrato)
    public
    view
    returns (uint valorMulta){
        valorMulta = valor*numeroMaximoLegalDeAlugueisParaMulta;   
    }

}

/*
LEMBRAR DESTES LINKS: 
https://solidity.readthedocs.io/en/v0.5.12/types.html
https://medium.com/@vieira.lucas/solidity-crie-contratos-inteligentes-para-a-blockchain-ethereum-c771eb8567cf
https://www.udemy.com/course/contratos-inteligentes/ - INSCREVEEEEEER
*/
