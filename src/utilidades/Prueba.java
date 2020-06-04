package utilidades;
import java.util.List;
import java.io.*;

import entidades.Genero;
import entidades.Municipio;
import modelo.GeneroDao;
import modelo.MunicipioDao;
public class Prueba {

	public static void main(String[] args) {
		
	MunicipioDao md= new MunicipioDao();
	Municipio m = new Municipio();
	List<Municipio> lm= Conexion.getEm().createQuery("from Municipio  order by departamento asc").getResultList();
	String si="];}else if(departamento.value==";
	String sic=") {";
	String opt="var optionArray=[";
	char barra='|';
	char coma=',';
	char comillas='"';
	FileWriter fichero = null;
    PrintWriter pw = null;
    int j=0;
    int i=0;
    try
    {
        fichero = new FileWriter("/home/poufate/Descargas/RECURSOS Code/Departamentos-Municipios (1)/texto.txt/archivo.js"
        		);
        pw = new PrintWriter(fichero);
        
        Integer[] departamentos= {5 , 8 , 11 , 13 , 15 , 17 , 18 , 19 , 20 , 23 , 25 , 27 , 41 , 44 , 47 , 50 , 52 , 54 , 63 , 66 , 68 , 70 , 73 , 76 , 81 , 85 , 86 , 88 , 91 , 94 , 95 , 97 , 99 };
        

        pw.print("if(departamento.value=="+'"'+"5"+'"'+"){");
        
        pw.print(opt+comillas+barra+comillas);
        byte k=0;
        for(i=0;i<lm.size();i++) {
        	if(lm.get(i+1).equals(null)) {
        		k=0;
        	}else {
        		k=1;
        	}
        	if(lm.get(i+k).getDepartamento().getIdDepartamento()==departamentos[j])
        	 {
        	pw.print(coma);
        	pw.print(comillas);
        	pw.print(lm.get(i).getIdMunicipio());
        	pw.print(barra);
        	pw.print(lm.get(i).getMunicipio());
        	pw.print(comillas);
        	
        	
        	}else {
        		pw.print(coma);
            	pw.print(comillas);
            	pw.print(lm.get(i).getIdMunicipio());
            	pw.print(barra);
            	pw.print(lm.get(i).getMunicipio());
            	pw.print(comillas);
          
                if(!departamentos[j+1].equals(null)) {
                	
                	j++;
                	pw.println(si+comillas+departamentos[j]+comillas+sic);
                	
                	pw.println(opt+comillas+barra+comillas);
                }
                
        	}
        
        }
        

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("toteado j: "+j+"i: "+i);
        
    } finally {
       try {
       // Nuevamente aprovechamos el finally para 
    	     fichero.close();// asegurarnos que se cierra el fichero.
       if (null != fichero)
          fichero.close();
       } catch (Exception e2) {
          e2.printStackTrace();
       }
    }
	
	}
	
	
}
