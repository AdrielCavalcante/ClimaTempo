package servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Base64;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ConsultaClima
 */
public class ConsultaClima extends jakarta.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ConsultaClima() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws IOException {
		// Pega o campo cidade do form
		String cidade = request.getParameter("cidade");
		
		// Requisição a API
		StringBuffer resposta = new StringBuffer();
		resposta.append("");
		
		StringBuffer respostaPrevisaoDias = new StringBuffer();
		respostaPrevisaoDias.append("");
		
		try {
            // Cria uma URL com a URL da API
			URL url = new URL("https://api.openweathermap.org/data/2.5/weather?q="+ cidade +"&appid=b99f08a3b28407a8b6515ebe2fd8f05c&lang=pt_br");
			
			URL urlPrevisaoDias = new URL("https://api.openweathermap.org/data/2.5/forecast?q="+ cidade +"&appid=b99f08a3b28407a8b6515ebe2fd8f05c&lang=pt_br");
			
            // Abre uma conexão HTTP com a URL
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Define o método de requisição (GET, POST, etc.)
            connection.setRequestMethod("GET");

            // Define o tempo limite da conexão (opcional)
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);

            // Faz a requisição à API
            int responseCode = connection.getResponseCode();
            if (responseCode == 200) { // 200 OK
                // Lê a resposta da API
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line;

                while ((line = reader.readLine()) != null) {
                    resposta.append(line);
                }
                reader.close();
            } else if(responseCode == 404) { // 404 Not found
            	resposta.append("Cidade não encontrada");
            } else {
            	System.out.println("Erro na requisição: Código de resposta " + responseCode);
            }

            // Fecha a conexão
            connection.disconnect();

            HttpURLConnection connectionPrevisaoDias = (HttpURLConnection) urlPrevisaoDias.openConnection();
            
            connectionPrevisaoDias.setRequestMethod("GET");
            connectionPrevisaoDias.setConnectTimeout(5000);
            connectionPrevisaoDias.setReadTimeout(5000);
            // Previsão dos 5 dias
            int responseCodePrevisaoDias = connectionPrevisaoDias.getResponseCode();

            if (responseCodePrevisaoDias == 200) { // 200 OK
                // Lê a resposta da API
                BufferedReader reader2 = new BufferedReader(new InputStreamReader(connectionPrevisaoDias.getInputStream()));
                String line2;

                while ((line2 = reader2.readLine()) != null) {
                    respostaPrevisaoDias.append(line2);
                }
                
                reader2.close();
            } else if(responseCodePrevisaoDias == 404) { // 404 Not found
            	respostaPrevisaoDias.append("Cidade não encontrada");
            } else {
            	System.out.println("Erro na requisição: Código de resposta " + responseCodePrevisaoDias);
            }

            // Fecha a conexão
            connectionPrevisaoDias.disconnect();

        } catch (IOException e) {
            e.printStackTrace();
        }
		
		try {
		      FileWriter myWriter = new FileWriter("log.txt", true);
		      myWriter.write(cidade + " consultada por alguém às "+ LocalDateTime.now() +" \n");
		      myWriter.close();
		    } catch (IOException e) {
		      System.out.println("Ocorreu um erro!");
		      e.printStackTrace();
		    }
		
		HttpSession session = request.getSession();
		System.out.println("Dias: " + respostaPrevisaoDias);
		System.out.println("Resposta da Previsão de Dias: " + respostaPrevisaoDias.toString());
		session.setAttribute("respostaAPI", resposta.toString());
		session.setAttribute("respostaAPIdias", respostaPrevisaoDias.toString());

		response.sendRedirect("res.jsp");
	}

}
