// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

/**
 * @title IDuplicata
 * @dev Define funcoes de uma Duplicata. Fonte: https://www.serasa.com.br/carteira-digital/blog/duplicata-o-que-e/
 * @author Felipe Lemos
 */
interface IDuplicata {

    /**
     * @dev Retorna a data de vencimento
     */
    function dataVencimento() external view returns (uint256);

    /**
     * @dev Retorna o nome do comprador
     */
    function nomeComprador() external view returns (string memory);

    /**
     * @dev Retorna o nome do vendedor
     */
    function nomeVendedor() external view returns (string memory);

    /**
     * @dev Retorna o numero do pedido
     */
    function numeroPedido() external view returns (string memory);

    /**
     * @dev Retorna o numero da nota fiscal
     */
    function numeroNotaFiscal() external view returns (string memory);
}