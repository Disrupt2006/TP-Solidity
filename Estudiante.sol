// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notasmaterias;

    string public Snombre_completo;

    constructor (string memory nombre, string memory apellido, string memory curso)
    {
        _nombre = nombre;
        _apellido = apellido;
        _curso = curso;

        _docente = msg.sender;
    }

    function apellido() public view returns (string memory)
    {
        return _apellido;
    }
    
    function JuntarTexto(string memory added_text) public 
    {
        Snombre_completo = string(abi.encodePacked(_nombre, " ", _apellido));
    }

    function nombre_completo() public view returns (string memory)
    {
        return Snombre_completo;
    }

    function curso() public view returns (string memory)
    {
        return _curso;
    }

    function set_nota_materia (uint nota, string memory materia)
    {
        
    }
}
