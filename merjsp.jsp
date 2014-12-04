<%@ page language="java"%>
<%@ page import="java.io.File,java.io.BufferedReader,java.io.FileReader,java.io.BufferedWriter,java.io.FileWriter, java.io.FilenameFilter"%>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">

<%! 
String cacheFileName;
String cacheFileNameCSS;
int len;
    
java.io.FileWriter outFile;    
java.io.BufferedWriter writer;
java.io.BufferedReader reader;

%>

<% 

try
{
	cacheFileName = request.getRealPath("/") + "js//main.js";    
	cacheFileNameCSS = request.getRealPath("/") + "css//main.css"; 
   
	outFile = new java.io.FileWriter(cacheFileName);   
	writer = new java.io.BufferedWriter(outFile);
   
	java.io.File fileList = new java.io.File(request.getRealPath("/") + "js");
	//out.println(request.getRealPath("/") + "js");
   
	File[] jsFiles =  fileList.listFiles(new FilenameFilter() {
		public boolean accept(File dir, String name)
		{
			return (name.endsWith(".js") && !name.equals("main.js"));
		}
	});
   
	for (int i = 0; i < jsFiles.length; i++)
	{
		reader = new java.io.BufferedReader(new FileReader(request.getRealPath("/") + "js//" + jsFiles[i].getName()));
	
		//out.println(request.getRealPath("/") + "js//" + jsFiles[i].getName());
    
		String line;
    
		while((line = reader.readLine()) != null)
		{
			writer.write(line,0,line.length());
		}
    
		reader.close();
		writer.write(";",0,1);
	}
	writer.close();	
    outFile.close();
    
    //for css
    
    outFile = new java.io.FileWriter(cacheFileNameCSS);   
    writer = new java.io.BufferedWriter(outFile);
    
    fileList = new java.io.File(request.getRealPath("/") + "css");
    
    File[] cssFiles = fileList.listFiles(new FilenameFilter() {
        public boolean accept(File dir, String name)
        {
            return (name.endsWith(".css") && !name.equals("main.css"));
        }
    });
    
    for (int i = 0; i< cssFiles.length; i++)
    {
        reader = new java.io.BufferedReader(new FileReader(request.getRealPath("/") + "css//" + cssFiles[i].getName()));
        String line;
                                       
        while ( (line = reader.readLine()) != null )
        {
            writer.write(line,0,line.length());
        }
        
        reader.close();
    }
    writer.close();
    outFile.close();
                                       
}
catch (java.io.FileNotFoundException ex)
{
	out.println(ex.getMessage());
}
catch (java.io.IOException ex)
{
	out.println(ex.getMessage());
}
catch(Exception ex)
{
    out.println(ex.getMessage());
}
    
%>

<script type="text/javascript" src="js/main.js"></script>

<body>

<button onclick="acall()">Click me A</button><br/>
<button onclick="bcall()">Click me B</button><br>
<button onclick="ccall()">Click me C</button><br/>
<button onclick="dcall()">Click me D</button>
<div id="acolor">hello</div>
<div id="bcolor">hello</div>
<div id="ccolor">hello</div>
<div id="dcolor">hello</div>
</body>
</html>