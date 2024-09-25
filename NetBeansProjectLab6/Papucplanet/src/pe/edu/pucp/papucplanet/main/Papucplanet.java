/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package pe.edu.pucp.papucplanet.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.papucplanet.cine.model.Genero;
import pe.edu.pucp.papucplanet.cine.model.Pelicula;
import pe.edu.pucp.papucplanet.cine.model.Sede;
import pe.edu.pucp.papucplanet.cine.dao.ButacaDAO;
import pe.edu.pucp.papucplanet.cine.model.EstadoButaca;
import pe.edu.pucp.papucplanet.cine.model.Butaca;
import pe.edu.pucp.papucplanet.cine.dao.ButacaFuncionDAO;
import pe.edu.pucp.papucplanet.cine.model.ButacaFuncion;
import pe.edu.pucp.papucplanet.cine.model.Funcion;
import pe.edu.pucp.papucplanet.cine.dao.FuncionDAO;
import pe.edu.pucp.papucplanet.cine.dao.PeliculaDAO;
import pe.edu.pucp.papucplanet.cine.dao.SalaDAO;
import pe.edu.pucp.papucplanet.cine.dao.SedeDAO;
import pe.edu.pucp.papucplanet.cine.model.Sala;
import pe.edu.pucp.papucplanet.cine.mysql.FuncionMySQL;
import pe.edu.pucp.papucplanet.cine.mysql.PeliculaMySQL;
import pe.edu.pucp.papucplanet.cine.mysql.SalaMySQL;
import pe.edu.pucp.papucplanet.cine.mysql.SedeMySQL;
import pe.edu.pucp.papucplanet.confiteria.dao.AlimentoDAO;
import pe.edu.pucp.papucplanet.confiteria.dao.BebidaDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Alimento;
import pe.edu.pucp.papucplanet.confiteria.model.Bebida;
import pe.edu.pucp.papucplanet.confiteria.model.TipoAlimento;
import pe.edu.pucp.papucplanet.confiteria.mysql.AlimentoMySQL;
import pe.edu.pucp.papucplanet.confiteria.mysql.BebidaMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.AdministradorDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.ClienteDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.CuentaDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.GestionUsuarioDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cliente;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Cuenta;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Usuario;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.AdministradorMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.ClienteMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.CuentaMySQL;

/**
 *
 * @author carlo
 */
public class Papucplanet {

    /**
     * @param args the command line arguments
     */
    public static void testAdministrador() throws Exception {
        AdministradorDAO locura = new AdministradorMySQL();
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = formato.parse("1990-01-01");

        // Crear Administrador
        Administrador administrador = new Administrador();
        administrador.setCodigo("A123");
        administrador.setDni("12345678");
        administrador.setNombre("Lucas");
        administrador.setPrimerApellido("Chad");
        administrador.setSegundoApellido("Sigma");
        administrador.setGenero('M');
        administrador.setFechaNacimiento(fechaNacimiento);

        int resultado = locura.insertar(administrador);
        if (resultado > 0) {
            System.out.println("Administrador insertado correctamente con ID: " + administrador.getId());
        } else {
            System.out.println("Error al insertar administrador.");
        }

        // Obtener Administrador por ID
        int idAdministrador = 1;
        Administrador administrador1 = locura.obtenerPorCodigo(idAdministrador);
        if (administrador1 != null) {
            System.out.println(administrador1.imprimirDatos());
        } else {
            System.out.println("No se encontró un administrador con el ID: " + idAdministrador);
        }

        // Listar Administradores
        ArrayList<Administrador> administradores = locura.listar();
        for (Administrador ad : administradores) {
            System.out.println(ad.imprimirDatos());
        }

        // Eliminar Administrador
        resultado = locura.eliminar(1);
        if (resultado > 0) {
            System.out.println("Administrador eliminado correctamente con ID: 1");
        } else {
            System.out.println("Error al eliminar administrador.");
        }
    }
    public static void testCliente() throws Exception {
        ClienteDAO clienteDAO = new ClienteMySQL();
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = formato.parse("1990-01-01");

        // Crear Cliente
        Sede sede = new Sede();
        sede.setIdSede(1);
        sede.setUniversidad("PUCP");
        sede.setUbicacion("SAN MIGUEL");

        Cliente cliente = new Cliente();
        cliente.setDni("76211902");
        cliente.setNombre("Guanira");
        cliente.setPrimerApellido("Erasmo");
        cliente.setSegundoApellido("Allasi");
        cliente.setGenero('F');
        cliente.setFechaNacimiento(fechaNacimiento);
        cliente.setSede(sede);

        int resultado = clienteDAO.insertar(cliente);
        if (resultado > 0) {
            System.out.println("Cliente insertado con el ID: " + cliente.getId());
        } else {
            System.out.println("No se pudo insertar al cliente.");
        }

        // Obtener Cliente por ID
        int idCliente = 2;
        cliente = clienteDAO.obtenerPorCodigo(idCliente);
        if (cliente != null) {
            System.out.println(cliente.imprimirDatos());
        } else {
            System.out.println("No se encontró un cliente con el ID: " + idCliente);
        }

        // Actualizar Cliente
        cliente.setNombre("Guanira PRO");
        resultado = clienteDAO.actualizar(cliente);
        if (resultado > 0) {
            System.out.println(clienteDAO.obtenerPorCodigo(idCliente).imprimirDatos());
        } else {
            System.out.println("No se pudo actualizar el cliente.");
        }

        // Listar Clientes
        ArrayList<Cliente> clientes = clienteDAO.listar();
        for (Cliente cli : clientes) {
            System.out.println(cli.imprimirDatos());
        }

        // Eliminar Cliente
        resultado = clienteDAO.eliminar(idCliente);
        if (resultado > 0) {
            System.out.println("Cliente eliminado con éxito.");
        } else {
            System.out.println("No se pudo eliminar el cliente.");
        }
    }
    public static void testCuenta(Administrador administrador) throws Exception {
        CuentaDAO cuentaDAO = new CuentaMySQL();

        // Crear Cuenta
        Cuenta cuenta = new Cuenta();
        cuenta.setCorreo("vegetta777OMGRexXx@pucp.edu.pe");
        cuenta.setPassword("GuaniraXErasmo");
        cuenta.setUsuario(administrador);

        int resultado = cuentaDAO.insertar(cuenta);
        if (resultado > 0) {
            System.out.println("Cuenta insertada con el ID: " + cuenta.getUsuario().getId());
        } else {
            System.out.println("No se pudo insertar la cuenta.");
        }

        // Obtener Cuenta por ID
        cuenta = cuentaDAO.obtenerPorCodigo(administrador.getId());
        if (cuenta != null) {
            System.out.println(cuenta.imprimirDatos());
        } else {
            System.out.println("No se encontró una cuenta con el ID: " + administrador.getId());
        }

        // Actualizar Cuenta
        cuenta.setCorreo("guaniraPROgamer");
        resultado = cuentaDAO.actualizar(cuenta);
        if (resultado > 0) {
            System.out.println(cuentaDAO.obtenerPorCodigo(administrador.getId()).imprimirDatos());
        } else {
            System.out.println("No se pudo actualizar la cuenta.");
        }

        // Listar Cuentas
        ArrayList<Cuenta> cuentas = cuentaDAO.listar();
        for (Cuenta cu : cuentas) {
            System.out.println(cu.imprimirDatos());
        }

        // Eliminar Cuenta
        resultado = cuentaDAO.eliminar(administrador.getId());
        if (resultado > 0) {
            System.out.println("Cuenta eliminada con éxito.");
        } else {
            System.out.println("No se pudo eliminar la cuenta.");
        }
    }
    
    public static void testCine(){
        Sede sede = new Sede();
        sede.setUniversidad("PUCP");
        sede.setIdSede(1);
        sede.setUbicacion("SAN MIGUEL");
        sede.setActivo(true);
        
        Pelicula pelicula = new Pelicula();
        pelicula.setIdPelicula(1);
        pelicula.setTitulo("Intesamente 2");
        pelicula.setGenero(Genero.COMEDIA);
        pelicula.setDuracion(12.00);
        pelicula.setSinopsis("Pelicula sobre las emociones");
        pelicula.setActivo(true);
        
        Sala sala = new Sala();
        sala.setIdSala(4321);
        sala.setCapacidad(30);
        sala.setNumeroSala(7);
        sala.setSede(sede);
        sala.setActivo(true);
        
        Funcion funcion = new Funcion();
        funcion.setSala(sala);
        funcion.setIdFuncion(7777);
        funcion.setDia(new Date());
        funcion.setPelicula(pelicula);
        funcion.setActivo(true);
        funcion.setHorarioFin(LocalTime.NOON);
        funcion.setHorarioInicio(LocalTime.NOON);
        
        Butaca butaca = new Butaca();
        butaca.setIdButaca(10);
        butaca.setFila('A');
        butaca.setSala(sala);
        butaca.setColumna(2);
        butaca.setDiscapacitado(true);
        butaca.setActivo(true);
        
        ButacaFuncion butacaFuncion = new ButacaFuncion();
        butacaFuncion.setIdButaca(10);
        butacaFuncion.setFila('A');
        butacaFuncion.setSala(sala);
        butacaFuncion.setColumna(2);
        butacaFuncion.setDiscapacitado(true);
        butacaFuncion.setActivo(true);
        butacaFuncion.setActivo(true);
        butacaFuncion.setEstado(EstadoButaca.DISPONIBLE);
        butacaFuncion.setFuncion(funcion);
        butacaFuncion.setIdButacaFuncion(100);
        butacaFuncion.setPrecio(100);
        
        PeliculaDAO peliDao = new PeliculaMySQL();
        System.out.println("INSERT");
        peliDao.insertar(pelicula);
        pelicula.setTitulo(pelicula.getTitulo()+"+");
        System.out.println("MODIFICAR");
        peliDao.modificar(pelicula);
        
        Pelicula peli2 = peliDao.obtenerPorId(1);
        pelicula.setTitulo(pelicula.getTitulo()+"+");
        peli2.setIdPelicula(1);
        System.out.println("INSERT");
        peliDao.insertar(peli2);
        System.out.println("ELIMINAR");
        peliDao.eliminar(1);
        
    }
    // Funciones CRUD para Sede
    public static void testSede() throws Exception {
        SedeDAO sedeDao = new SedeMySQL();

        // Crear Sede
        Sede sede = new Sede();
        sede.setUniversidad("PUCP");
        sede.setUbicacion("SAN MIGUEL");
        sede.setActivo(true);
        
        int resultado = sedeDao.insertar(sede);
        if (resultado > 0) {
            System.out.println("Sede insertada correctamente con ID: " + sede.getIdSede());
        } else {
            System.out.println("Error al insertar la sede.");
        }
        // Obtener Sede por ID
        Sede sede1 = sedeDao.obtenerPorId(1);
        if (sede1 != null) {
            System.out.println(sede1.imprimirDatos());
        } else {
            System.out.println("No se encontró una sede con el ID:"+ resultado);
        }

        // Actualizar Sede
        sede.setUniversidad("PUCP Mejorada");
        resultado = sedeDao.modificar(sede);
        if (resultado > 0) {
            System.out.println("Sede actualizada correctamente.");
        } else {
            System.out.println("No se pudo actualizar la sede.");
        }

        // Listar Sedes
        ArrayList<Sede> sedes = sedeDao.listarTodos();
        for (Sede sd : sedes) {
            System.out.println(sd.imprimirDatos());
        }

        // Eliminar Sede
        resultado = sedeDao.eliminar(1);
        if (resultado > 0) {
            System.out.println("Sede eliminada correctamente.");
        } else {
            System.out.println("Error al eliminar la sede.");
        }
    }

    // Funciones CRUD para Pelicula
    public static void testPelicula() throws Exception {
        PeliculaDAO peliDao = new PeliculaMySQL();

        // Crear Pelicula
        Pelicula pelicula = new Pelicula();
        pelicula.setTitulo("Intensamente 2");
        pelicula.setGenero(Genero.COMEDIA);
        pelicula.setDuracion(12.00);
        pelicula.setSinopsis("Pelicula sobre las emociones");
        pelicula.setActivo(true);

        int resultado = peliDao.insertar(pelicula);
        if (resultado > 0) {
            System.out.println("Pelicula insertada correctamente con ID: " + pelicula.getIdPelicula());
        } else {
            System.out.println("Error al insertar la película.");
        }

        // Obtener Pelicula por ID
        Pelicula pelicula1 = peliDao.obtenerPorId(1);
        if (pelicula1 != null) {
            System.out.println(pelicula1.imprimirDatos());
        } else {
            System.out.println("No se encontró una película con el ID: 3333");
        }

        // Actualizar Pelicula
        pelicula.setTitulo("Intensamente 2 - Director's Cut");
        resultado = peliDao.modificar(pelicula);
        if (resultado > 0) {
            System.out.println("Película actualizada correctamente.");
        } else {
            System.out.println("No se pudo actualizar la película.");
        }

        // Listar Peliculas
        ArrayList<Pelicula> peliculas = peliDao.listarTodos();
        for (Pelicula pel : peliculas) {
            System.out.println(pel.imprimirDatos());
        }

        // Eliminar Pelicula
        resultado = peliDao.eliminar(1);
        if (resultado > 0) {
            System.out.println("Película eliminada correctamente.");
        } else {
            System.out.println("Error al eliminar la película.");
        }
    }
//
//    // Funciones CRUD para Sala
    public static void testSala() throws Exception {
        SalaDAO salaDao = new SalaMySQL();

        // Crear Sala
        Sala sala = new Sala();
        Sede sede = new Sede();
        sala.setCapacidad(30);
        sala.setNumeroSala(7);
        sala.setActivo(true);
        sala.setSede(sede);
        sala.getSede().setIdSede(1);
        int resultado = salaDao.insertar(sala);
        if (resultado > 0) {
            System.out.println("Sala insertada correctamente con ID: " + sala.getIdSala());
        } else {
            System.out.println("Error al insertar la sala.");
        }

        // Obtener Sala por ID
        Sala sala1 = salaDao.obtenerPorId(1);
        if (sala1 != null) {
            System.out.println(sala1.imprimirDatos());
        } else {
            System.out.println("No se encontró una sala con el ID: 4321");
        }

        // Actualizar Sala
        sala.setCapacidad(35);
        resultado = salaDao.modificar(sala);
        if (resultado > 0) {
            System.out.println("Sala actualizada correctamente.");
        } else {
            System.out.println("No se pudo actualizar la sala.");
        }

        // Listar Salas
        ArrayList<Sala> salas = salaDao.listarTodos();
        for (Sala sa : salas) {
            System.out.println(sa.imprimirDatos());
        }

        // Eliminar Sala
        resultado = salaDao.eliminar(1);
        if (resultado > 0) {
            System.out.println("Sala eliminada correctamente.");
        } else {
            System.out.println("Error al eliminar la sala.");
        }
    }


    
    public static void main(String[] args) throws ParseException {
        // Test ADMIN
        try{
            testAdministrador();
            testSede();
            
            testCliente();
            Administrador administrador = new Administrador();
            administrador.setId(1);
            testCuenta(administrador);
            testCine();
            
            testPelicula();
            testSala();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }

    }
}
