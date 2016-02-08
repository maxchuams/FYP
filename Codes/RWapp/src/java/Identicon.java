/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author KIANLAM
 */
import src.model.identicon.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;

public class Identicon {
//source: https://github.com/davidhampgonsalves/Contact-Identicons
	public static void main(String [] args) throws IOException {
		
		if(args.length != 1) {
			System.err.println("usage: user name to generate identicon from.");
			return;
		}

		//get input string
		String userName = args[0];

		HashGeneratorInterface hashGenerator = new MessageDigestHashGenerator("MD5");

		BufferedImage identicon = IdenticonGenerator.generate(userName, hashGenerator);
		
		//save identicon to file
		ImageIO.write(identicon,"PNG",new File(userName + ".png"));
	}
}