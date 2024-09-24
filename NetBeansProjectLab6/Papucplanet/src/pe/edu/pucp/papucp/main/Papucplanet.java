package pe.edu.pucp.papucp.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import pe.edu.pucp.papucplanet.confiteria.dao.AlimentoDAO;
import pe.edu.pucp.papucplanet.confiteria.dao.BebidaDAO;
import pe.edu.pucp.papucplanet.confiteria.model.Alimento;
import pe.edu.pucp.papucplanet.confiteria.model.Bebida;
import pe.edu.pucp.papucplanet.confiteria.model.TipoAlimento;
import pe.edu.pucp.papucplanet.confiteria.mysql.AlimentoMySQL;
import pe.edu.pucp.papucplanet.confiteria.mysql.BebidaMySQL;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.AdministradorDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.dao.GestionUsuarioDAO;
import pe.edu.pucp.papucplanet.gestionUsuario.model.Administrador;
import pe.edu.pucp.papucplanet.gestionUsuario.mysql.AdministradorMySQL;

public class Papucplanet {

    public static void main(String[] args) throws ParseException {
        // TODO code application logic here
//        AdministradorDAO locura;
//        locura = new AdministradorMySQL();
//        
//        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
//        Date fechaNacimiento = formato.parse("1990-01-01");
//        Administrador administrador = new Administrador();
//        administrador.setCodigo("A123");
//        administrador.setDni("12345678");
//        administrador.setNombre("Juan");
//        administrador.setPrimerApellido("Pérez");
//        administrador.setSegundoApellido("Sánchez");
//        administrador.setGenero('M');
//        administrador.setFechaNacimiento(fechaNacimiento);
//
//        // Llamar al método para insertar el administrador
//        locura.insertar(administrador);
//        int resultado = locura.insertar(administrador);
//
//        if (resultado == 1) {
//            System.out.println("Administrador insertado correctamente con ID: " + administrador.getId());
//        } else {
//            System.out.println("Error al insertar administrador.");
//        }
//        int idAdministrador = 4;
//        Administrador administrador1 = locura.obtenerPorCodigo(idAdministrador);
//
//        if (administrador1 != null) {
//            System.out.println("ID: " + administrador1.getId());
//            System.out.println("DNI: " + administrador1.getDni());
//            System.out.println("Nombre: " + administrador1.getNombre());
//            System.out.println("Primer Apellido: " + administrador1.getPrimerApellido());
//            System.out.println("Segundo Apellido: " + administrador1.getSegundoApellido());
//            System.out.println("Genero: " + administrador1.getGenero());
//            System.out.println("Fecha de Nacimiento: " + administrador1.getFechaNacimiento());
//            System.out.println("Código: " + administrador1.getCodigo());
//            System.out.println("Activo: " + administrador1.getActivo());
//        } else {
//            System.out.println("No se encontró un administrador con el ID: " + idAdministrador);
//        }
//        ArrayList<Administrador> administradores = locura.listar();
//        for (Administrador ad : administradores) {
//            System.out.println("ID: " + ad.getId());
//            System.out.println("DNI: " + ad.getDni());
//            System.out.println("Nombre: " + ad.getNombre());
//            System.out.println("Primer Apellido: " + ad.getPrimerApellido());
//            System.out.println("Segundo Apellido: " + ad.getSegundoApellido());
//            System.out.println("Genero: " + ad.getGenero());
//            System.out.println("Fecha de Nacimiento: " + ad.getFechaNacimiento());
//            System.out.println("Código: " + ad.getCodigo());
//            System.out.println("Activo: " + ad.getActivo());
//        }
//        System.out.println("hola!");
//          Alimento alimento;
//          AlimentoDAO olam=new AlimentoMySQL();
//          //obtener por codigo
//          alimento=olam.obtenerPorId(2);
//          System.out.println(alimento.getNombre());
          //insertar
//          alimento.setNombre("Chocolate");
//          alimento.setPesoPromedio(5);
//          alimento.setPrecio(3);
//          alimento.setTipoAlimento(TipoAlimento.POSTRE);
//          olam.insertar(alimento);
          //modificar
//          alimento.setPrecio(10);
//          olam.actualizar(alimento);
//          //eliminar
//          olam.eliminar(3);
//          //listar
//         ArrayList<Alimento> prueba;
//         prueba=olam.listar();
//         for(Alimento a:prueba){
//             System.out.println(a.getNombre())  ;
//         }
//        //BEBIDA
//        Bebida b=new Bebida();
//        b.setNombre("Inka");
//        b.setOnzas(5);
//        b.setPrecio(3);
//        b.setTieneHielo(true);
        BebidaDAO papu= new BebidaMySQL();
        //insertar
//        papu.insertar(b);
        //seleccionar
//        Bebida b;
//        b=papu.obtenerPorId(6);
//        System.out.println(b.getNombre());
//        //actualizar
//        b.setPrecio(7);
//        papu.actualizar(b);
//        //eliminar
//        papu.eliminar(6);
//        //lista
        ArrayList <Bebida> arr;
        arr=papu.listar();
        for(Bebida b:arr)
            System.out.println(b.getNombre());
    }
    
}
