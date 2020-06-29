package API;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class APICpf {
    public static String request(String CPF) {
        String json = "{";
        
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse("http://localhost:8084/Serasa-backend/serasa.xml");
            
            NodeList nodes = document.getElementsByTagName("apt");
            for(int i = 0; i < nodes.getLength(); i++) {
                Element element = (Element)nodes.item(i);
                if(element.getAttribute("cpf").equals(CPF)) {
                    json += "\"" + i + "\"" + " : {";
                    json += "\"type\": \"" + element.getChildNodes().item(1).getTextContent() + "\",";
                    json += "\"value\": " + element.getChildNodes().item(3).getTextContent();
                    json += "},";
                }
            }
            json = json.substring(0, json.length()-1);
        }
        catch(Exception e) {
            json = "{";
        }
        
        json += "}";
        
        return json;
    }
}
