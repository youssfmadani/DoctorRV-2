package conn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import conn.entity.User;

public class Userdaw {
	private Connection conn;

	public Userdaw(Connection conn) {
		super();
		this.conn = conn;
	}

	// Méthode pour inscrire un utilisateur
	public boolean UserRegister(User u) {
		boolean f = false;
		try {
			String sql = "INSERT INTO user_dtls(full_name, email, password) VALUES(?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// Méthode pour se connecter à l'utilisateur
	public User UserLogin(User u) {
		User user = null;
		try {
			// Requête pour trouver un utilisateur avec l'email et le mot de passe
			String query = "SELECT * FROM user_dtls WHERE email = ? AND password = ?";
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setString(1, u.getEmail());  // Paramètre pour l'email
			stmt.setString(2, u.getPassword());  // Paramètre pour le mot de passe

			// Exécution de la requête
			ResultSet rs = stmt.executeQuery();

			// Si un utilisateur correspondant est trouvé
			if (rs.next()) {
				// Créer un objet User avec les informations récupérées
				user = new User(
						rs.getString("full_name"),  // Récupère le nom complet
						rs.getString("email"),      // Récupère l'email
						rs.getString("password")    // Récupère le mot de passe
				);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;  // Retourne l'utilisateur si trouvé, sinon retourne null
	}
}
