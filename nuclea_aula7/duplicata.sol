// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

import "./owner.sol";
import "./titulo.sol";
import "./interfaceduplicata.sol";

/**
 * @title Debenture
 * @dev Operacoes de uma debenture
 * @author Jeff Prestes
 */
 contract Debenture is IDuplicata, Titulo, Owner {

    string _emissor;
    string _comprador;
    string _numeroPedido;
    string _numeroNotaFiscal;
    uint256 immutable _dataEmissao;
    uint256 _valor;
    uint8 immutable _decimais;
    uint256 _prazoPagamento;
    uint16 _fracoes;
    string public rating;


    constructor(string memory emissor_, string memory comprador_, string memory numeroPedido_, string memory numeroNotaFiscal_) {
        _emissor = emissor_;
        _comprador = comprador_;
        _numeroPedido = numeroPedido_;
        _numeroNotaFiscal = numeroNotaFiscal_;
        _dataEmissao = block.timestamp;
        _valor = 100000000;
        _decimais = 2;
        _prazoPagamento = _dataEmissao + 90 days;
        rating = "BBB-";
        _fracoes = 1000;
    }

    /**
     * @dev Retorna o valor nominal.
     */
    function valorNominal() external view returns (uint256) {
        return _valor;
    }

    /**
     * @dev Retorna o nome do Emissor.
     */
    function nomeEmissor() external view returns (string memory) {
        return _emissor;
    }

    /**
     * @dev Retorna a data da emissao.
     */
    function dataEmissao() external view returns (uint256) {
        return _dataEmissao;
    }

    /**
    * @dev muda o rating
    * @notice dependendo da situacao economica a empresa avaliadora pode mudar o rating
    * @param novoRating novo rating da debenture
    */
    function mudaRating(string memory novoRating) external onlyOwner returns (bool) {
        rating = novoRating;
        return true;
    }

    function alteraFracoes(uint16 fracoes_) external onlyOwner returns (bool) {
        require(fracoes_ >=100, "numero de fracoes baixo");
        _fracoes = fracoes_;
        return true;
    }

    /**
    * @dev retorna o valor da variavel fracoes
    * @notice informa o numero de fracoes da debenture
    */
    function fracoes() external view returns (uint16) {
        return _fracoes;
    }

    /**
    * @dev retorna a data de vencimento 
    * @notice informa o vencimento
    */
    function dataVencimento() external view returns (uint256) {
        return _prazoPagamento;
    }

    /**
    * @dev retorna o nome do comprador
    * @notice informa o nome do comprador
    */
    function nomeComprador() external view returns (string memory){
        return _comprador;
    }

    /**
    * @dev retorna o nome do vendedor
    * @notice informa o nome do vendedor do titulo
    */
    function nomeVendedor() external view returns (string memory){
        return _emissor;
    }

    /**
    * @dev retorna o numero do pedido
    * @notice informa o numero do pedido
    */
    function numeroPedido() external view returns (string memory) {
        return _numeroPedido;
    }

    /**
    * @dev retorna o numero da nota fiscal
    * @notice informa o numero da nota fiscal
    */
    function numeroNotaFiscal() external view returns (string memory) {
        return _numeroNotaFiscal;
    }
    

 }