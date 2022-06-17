// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante
{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notasmaterias;

    uint cantMaterias;
    string[] private _materias;


    constructor (string memory nombre_, string memory apellido_, string memory curso_)
    {
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;

        _docente = msg.sender;
    }

    function apellido() public view returns (string memory)
    {
        return _apellido;
    }
    

    function nombre_completo() public view returns (string memory)
    {
        return string(abi.encodePacked(_nombre, " ", _apellido));
    }

    function curso() public view returns (string memory)
    {
        return _curso;
    }

    function set_nota_materia(uint nota, string memory materia) public
    {
        require(msg.sender == _docente, "Solo el docente puede settear las notas");
        require(nota >= 1 && nota <= 100, "La nota debe ser entre 1 y 100");

        _notasmaterias[materia] = nota;

        _materias.push(materia);
        cantMaterias++;
    }

    function nota_materia(string memory materia) public view returns (uint)
    {
        return _notasmaterias[materia];
    }

    function aprobo(string memory materia) public view returns (bool)
    {
        
        if (_notasmaterias[materia] >= 60)
        {
            return true;
        }
        else 
        {
            return false;
        }
    
    }

    function promedio() public view returns (uint)
    {
        uint promedio_;
        uint promedioTotal;

        for (uint i = 0; i <= cantMaterias; i++)
        {
            promedio_ += _notasmaterias[_materias[i]];
        }

        
        promedioTotal = promedio_ / cantMaterias;
        
        return promedioTotal;
    }
}
