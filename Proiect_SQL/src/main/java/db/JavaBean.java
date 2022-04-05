package db;
import java.sql.*;
import java.time.LocalDate;

public class JavaBean {
    String error;
    Connection con;

    public JavaBean() {
    }
    
    
    public void connect() throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proiect_pibd?useSSL=false", "proiect", "Anaaremerepadurete");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect()
    
    
    public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "proiect", "Anaaremerepadurete");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd)
    
    
    public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "proiect", "Anaaremerepadurete");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd, String ip)
    
    
    
    public void disconnect() throws SQLException {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException sqle) {
            error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
            throw new SQLException(error);
        }
    } // disconnect()
    
    
    
    
    
    
    public void adaugaFormatie(String Nume, String Data_Infiintare, String Numar_Albume, String Gen_Muzical, String Tara_De_Origine  )
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into formatii(Nume, Data_Infiintare, Numar_Albume, Gen_Muzical, Tara_De_Origine ) values('" + Nume + "'  , '" + Data_Infiintare + "', '" + Numar_Albume + "' , '" + Gen_Muzical + "' , '" + Tara_De_Origine + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaFormatie()
    
    
    
    
    public void adaugaMembru(String Nume, String Prenume, String Data_Nasterii, String Nationalitate, String Avere)
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into membri(Nume, Prenume, Data_Nasterii, Nationalitate, Avere ) values('" + Nume + "'  , '" + Prenume + "', '" + Data_Nasterii + "' , '" + Nationalitate + "' , '" + Avere + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaMembru()
    
    
    
      public void adaugaContract(int idformatie, int idmembru, String Data_Semnare, String Data_Finalizare, String Clauza_De_Prelungire )
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into contracte(idformatie, idmembru, Data_Semnare, Data_Finalizare,  Clauza_De_Prelungire) values('" + idformatie + "'  , '" + idmembru + "', '" + Data_Semnare + "', '" + Data_Finalizare + "', '" + Clauza_De_Prelungire + "');");
               
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaContract()
   
    
    

    
    
    
    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select * from `proiect_pibd`.`" + tabel + "`;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeTabela()
    
    
    
    
    
    public ResultSet vedeContract() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select a.Nume NumeFormatie, a.Data_Infiintare, a.Numar_Albume, a.Gen_Muzical, a.Tara_De_Origine, b.Nume NumeMembru, b.Prenume PrenumeMembru, b.Data_Nasterii, b.Nationalitate, b.Avere,  c.idcontract, c.idformatie idformatie_contract, c.idmembru idmembru_contract, c.Data_Semnare, c.Data_Finalizare, c.Clauza_De_Prelungire from formatii a, membri b, contracte c where a.idformatie = c.idformatie and b.idmembru = c.idmembru;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeContract()
    
    
    
    
    
      public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                long aux;
                PreparedStatement delete;
                delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
                for (int i = 0; i < primaryKeys.length; i++) {
                    aux = java.lang.Long.parseLong(primaryKeys[i]);
                    delete.setLong(1, aux);
                    delete.execute();
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            } catch (Exception e) {
                error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
                throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeDateTabela()
    
    
    
    
    public void stergeTabela(String tabela) throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("delete from " + tabela + ";");
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeTabela()
    
    
    
    
    public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
        String update = "update " + tabela + " set ";
        String temp = "";
        if (con != null) {
            try {
                for (int i = 0; i < campuri.length; i++) {
                    if (i != (campuri.length - 1)) {
                        temp = temp + campuri[i] + "='" + valori[i] + "', ";
                    } else {
                        temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
                    }
                }
                update = update + temp;
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate(update);
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of modificaTabela()
    
    
    
    
    
    
    
    
    
    public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
            String queryString = ("SELECT * FROM " + tabela + " where idformatie=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinie()
    
    
    
    
    
    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
            String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()
    
    
    
    
    public ResultSet intoarceContractId(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
            String queryString = ("SELECT a.Nume NumeFormatie, a.Data_Infiintare, a.Numar_Albume, a.Gen_Muzical, a.Tara_De_Origine, b.Nume NumeMembru, b.Prenume PrenumeMembru, b.Data_Nasterii, b.Nationalitate, b.Avere,  c.idcontract, c.idformatie idformatie_contract, c.idmembru idmembru_contract, c.Data_Semnare, c.Data_Finalizare, c.Clauza_De_Prelungire from formatii a, membri b, contracte c WHERE a.idformatie = c.idformatie and b.idmembru = c.idmembru and idcontract = '" + ID + "';");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()
}




