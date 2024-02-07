pragma solidity 0.8.19;

// @author Felipe Lemos
// @title Execicio da aula 06
// Endereco contrato: 0x61fd3e9d6d36bf67549d3b5a679e1929b48c476e
contract ContratoAula06 {

    mapping(address=>uint256)  contasSaldos;

    event ColocaramNaConta(address quem, uint256 quanto);

    // @notice Coloca saldo na conta
    // @dev mapeia o valor informado com a conta a ser colocado saldo. Se a conta for 0x00aea14aFA59aeF0559f596FBC996AB961ECd685 gera um evento
    function colocaSaldoConta(address conta, uint256 valor) public  {
        require(valor > 0, "O valor tem ser positivo!");
        contasSaldos[conta] = valor;
        if (conta == address(0x00aea14aFA59aeF0559f596FBC996AB961ECd685)) {
            emit ColocaramNaConta(conta, valor);
        }
    }

    // @otice Visualiza saldo da conta
    // @dev verifica se a conta existe / tem saldo e retorna o valor em caso afirmativo
    // @return valor da conta
    function viewSaldoConta(address conta) public view returns (uint256) {
        require(contasSaldos[conta]>0, "A conta nao existe!");
        return contasSaldos[conta];
    }

}
