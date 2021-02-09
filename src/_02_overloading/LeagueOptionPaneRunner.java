package _02_overloading;

public class LeagueOptionPaneRunner {
	public static void main(String[] args) {
		new LeagueOptionPane().showMessageDialog("i like potatoes");
		new LeagueOptionPane().showMessageDialog("potatoes like i","random title");
		new LeagueOptionPane().showMessageDialog("potatoes i like","not random title","leagueDark.png");

	}
}
