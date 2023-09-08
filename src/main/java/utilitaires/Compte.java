package utilitaires;

public class Compte{
	public String nom, tel, email, ville, pays, mdps;
	public int _id;
	int code;
	public int type;
	public Compte(int _id, String nom, String tel, String email, String mdps, int code, String ville, String pays, int type) {
		this._id = _id;
		this.nom = nom;
		this.tel = tel;
		this.email = email;
		this.mdps = mdps;
		this.code = code;
		this.ville = ville;
		this.pays = pays;
		this.type = type;
	}

}
