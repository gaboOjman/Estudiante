// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notas_materias;
    string[] private _materias = new string[](0);

    constructor(string memory nombre, string memory apellido, string memory curso){
        _docente = msg.sender;
        _nombre = nombre;
        _apellido = apellido;
        _curso = curso;
    }

    function Apellido() public view returns (string memory){
        return _apellido;
    }

    function Nombre_completo() public view returns (string memory){
        return string(bytes.concat(bytes(_nombre), " ", bytes(_apellido)));
    }

    function Curso() public view returns (string memory){
        return _curso;
    }

    function Set_nota_materia (uint nota, string memory materia) public{
        require(_docente == msg.sender, "No sos docente");
        _materias.push(materia);
        _notas_materias[materia] = nota;
    } 

    function Nota_materia(string memory materia) public view returns (uint){
        return _notas_materias[materia];
    }

    function Aprobo(string memory materia) public view returns (bool){
        return (_notas_materias[materia] >= 60);
    }

    function Promedio() public view returns (uint){
        uint promedio = 0;
        for(uint i = 0; i < _materias.length; i++){
            promedio += _notas_materias[_materias[i]] / _materias.length;
        }
        return promedio;
    }
}