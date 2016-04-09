package src.model.identicon;

import java.security.MessageDigest;

/**
 *
 * @author KIANLAM
 */
public class MessageDigestHashGenerator implements HashGeneratorInterface {
	MessageDigest messageDigest;


    public MessageDigestHashGenerator(String algorithim) {
		try {
			messageDigest = MessageDigest.getInstance(algorithim);
		}catch(Exception e) {
			System.err.println("Error setting algorithim: " + algorithim);
		}
	}

    /**
     *Generate Hash of a string userna,e
     * 
     * @param input String to generate hash
     * @return hash in byte array
     */
    public byte[] generate(String input) {
		return messageDigest.digest(input.getBytes());
	}
}