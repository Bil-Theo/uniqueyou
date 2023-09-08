package utilitaires;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.Part;

public class outils {
	
	public static String getFileName(final Part part) {
		return null;
		
	}
	
	public static void stocker(String fileName, String uploadPath,File uploadDir, Part filePart) throws IOException {
		
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Écrire le fichier dans le dossier
        OutputStream out = null;
        InputStream fileContent = null;
        try {
            out = new FileOutputStream(new File(uploadPath + File.separator + fileName));
            fileContent = filePart.getInputStream();
            int read;
            final byte[] bytes = new byte[1024];
            while ((read = fileContent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
        } catch (FileNotFoundException e) {
            // Gérer l'erreur ici
        } finally {
            if (out != null) {
                out.close();
            }
            if (fileContent != null) {
                fileContent.close();
            }
        }
	}

	private static Object getServletContext() {
		// TODO Auto-generated method stub
		return null;
	}
}
