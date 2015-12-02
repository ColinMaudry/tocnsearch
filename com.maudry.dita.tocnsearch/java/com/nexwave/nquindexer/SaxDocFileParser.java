package com.nexwave.nquindexer;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;


import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.nexwave.nsidita.BlankRemover;
import com.nexwave.nsidita.DocFileInfo;
/**
 * Generic parser for populating a DocFileInfo object.
 * 
 * @version 1.0 2008-02-26
 * 
 * @author N. Quaine
 */
public class SaxDocFileParser extends DefaultHandler {
	
	//members
	protected DocFileInfo fileDesc = null;
	protected String projectDir = null;
	protected StringBuffer strbf = null;
	private StringBuffer tempVal = null;
	private boolean shortdescBool = false;
	private int shortTagCpt = 0;

	//methods
	/**
	 * Constructor
	 */
	public SaxDocFileParser () {

	}
	
	/**
	 * Initializer
	 */
	public int init(String inputDir){
		return 0;	
	}

	/**
	 * Parses the file to extract all the words for indexing and 
	 * some data characterizing the file. 
	 * @param file contains the fullpath of the document to parse  
	 * @return a DitaFileInfo object filled with data describing the file
	 */
	public DocFileInfo runExtractData(File file) {
		//initialization
		fileDesc = new DocFileInfo(file);
		strbf = new StringBuffer("");
		
		// Fill strbf by parsing the file
		parseDocument(file);

		return fileDesc;
	}

	public void parseDocument (File file) {
		//get a factory
		SAXParserFactory spf = SAXParserFactory.newInstance();
		
		spf.setValidating(false);
		
		try {
		
			//get a new instance of parser
			SAXParser sp = (SAXParser)spf.newSAXParser();
			// deactivate the validation
			sp.getXMLReader().setFeature("http://xml.org/sax/features/external-general-entities", false);
			sp.getXMLReader().setFeature( "http://apache.org/xml/features/nonvalidating/load-external-dtd",	false);
			//parse the file and also register this class for call backs
			System.out.println(file);
			
			long start = System.currentTimeMillis();
			//System.out.println("about to parse " + file.getName() + " >>> " + start);

			if ( RemoveValidationPI (file) == 0){
			    sp.parse("xx.html", this);
			}
			
			long finish = System.currentTimeMillis();
			//System.out.println("done parsing " + file.getName() + " >>> " + finish);
			//System.out.println("time = " + (finish - start) + " milliseconds");
			
		}catch(SAXException se) {
			System.out.println("SaxException");
			se.printStackTrace();

		}catch(ParserConfigurationException pce) {
			pce.printStackTrace();
		}catch (IOException ie) {
			ie.printStackTrace();
		}
	}
	
	//SAX parser Event Handlers:
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		if((qName.equalsIgnoreCase("title")) || (qName.equalsIgnoreCase("shortdesc"))) {
			tempVal = new StringBuffer();
		}
		if(qName.equalsIgnoreCase("div")) {
			String stemp = attributes.getValue("class");
			if (stemp !=null && stemp.equalsIgnoreCase("shortdesc")) {
				shortdescBool = true;
			}
			tempVal = new StringBuffer();
			strbf.append(" ");
		}
		if (shortdescBool == true) {
			shortTagCpt ++;			
		}
		strbf.append(" ");
	}
	
	public void characters(char[] ch, int start, int length) throws SAXException {
		
		String text = new String(ch,start,length);
		strbf.append(text);
		if (tempVal != null) { tempVal.append(text);}

	}
	
	public void endElement(String uri, String localName, String qName) throws SAXException {
		if(qName.equalsIgnoreCase("title")) {
			//add it to the list
			//myEmpls.add(tempEmp);
			fileDesc.setTitle(BlankRemover.rmWhiteSpace(tempVal.toString()));
			tempVal = null;
		}
		else if (shortdescBool) {
			shortTagCpt --;
			if (shortTagCpt == 0) {
			fileDesc.setShortdesc(BlankRemover.rmWhiteSpace(tempVal.toString().replace('\n', ' ')));
			tempVal = null;
			shortdescBool = false;
			}
		}		
	}
	
	public void processingInstruction(String target, String data) throws SAXException {
		//do nothing
		
	}
	
	/*public InputSource resolveEntity(String publicId, String systemId) 
		throws IOException, SAXException {
		
		// use the catalog to solve the doctype
		System.out.println("entities " + publicId + systemId);
		return null;
	}*/
	public InputSource resolveEntity(String publicId, String systemId)
	throws SAXException, IOException {
		//System.out.println("Entities " + publicId + "and" + systemId);
		// use dita ot (dost.jar) for resolving dtd paths using the calatog
		
	return null;
	}

	public int RemoveValidationPI (File file) {
		
		try {
			BufferedReader br = new BufferedReader(
	                new InputStreamReader(
	                 new FileInputStream(file),"UTF-8"));
			
			//PrintWriter pw = new PrintWriter(new FileOutputStream(new File("xx.html")));
			PrintWriter pw = new PrintWriter(new  OutputStreamWriter (new FileOutputStream(new File("xx.html")),"UTF-8"));
			
	
			while(true)
			{
				int i1, i2;
				boolean ok = true;
				try {
	
					String line = br.readLine();
	
			        
					if (line == null) {
						break;
					}
					//ok = line.matches("(.)*\\x26nbsp\\x3B(.)*");
					
					line = line.replaceAll("\\x26nbsp\\x3B", "&#160;");
	
					if (!line.contains("<!DOCTYPE html PUBLIC")) {
						if (line.contains("<?xml version")) {
							line = line.replaceAll("\\x3C\\x3Fxml[^\\x3E]*\\x3F\\x3E","\n");
						}
						pw.write(line + "\n");
					} else  
					{
						i1 = line.indexOf("<!DOCTYPE");
						i2 = line.indexOf(">", i1);
						while (i2 < 0) {
							
							line = line.concat(br.readLine());
							i2 = line.indexOf(">", i1);
						}
						String temp = line.substring(i1, i2);
						
						//ok = line.matches("(.)*\\x3C\\x21DOCTYPE[^\\x3E]*\\x3E(.)*");
						if (line.contains("<?xml version")) {
							line = line.replaceAll("\\x3C\\x3Fxml[^\\x3E]*\\x3F\\x3E","\n");
						}
						line = line.replaceAll("\\x3C\\x21DOCTYPE[^\\x3E]*\\x3E","\n");
						pw.write(line);
					}
				}
				catch (IOException e)
				{
					break;
				}
			}
	
			
			pw.flush();
			pw.close();
			br.close();
		}
		catch (IOException e)
		{
			return 1;
		}
		
		return 0; // return status

	}

}
