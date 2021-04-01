package kr.co.jboard.config;

public class Sql {
	
	
	public static final String SELECT_USER  	= "SELECT * FROM `JBOARD_USER` WHERE `uid`=? AND `pass`=PASSWORD(?);";
	
	public static final String SELECT_TERMS		= "SELECT * FROM `JBOARD_TERMS`;";
	
	public static final String SELECT_COUNT_ARTICLE = "SELECT COUNT(*) FROM `JBOARD_ARTICLE`;";
	
	public static final String SELECT_ARTICLE 	= "SELECT * FROM `JBOARD_ARTICLE` WHERE `seq`=?;"; 
	
	public static final String SELECT_ARTICLES 	= "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
											   	+ "JOIN `JBOARD_USER` AS b "
												+ "ON a.uid = b.uid "
												+ "ORDER BY `seq` DESC "
												+ "LIMIT ?, 10";

	public static final String INSERT_ARTICLE 	= "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW();";
	
	public static final String INSERT_COMMENT 	= "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`parent`=?,"
												+ "`content`=?,"
												+ "`uid`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW();";
	
	public static final String INSERT_USER		= "INSERT INTO `JBOARD_USER` SET "
												+ "`uid`=?,"
											    + "`pass`=PASSWORD(?),"
											    + "`name`=?,"
											    + "`nick`=?,"
											    + "`email`=?,"
											    + "`hp`=?,"
											    + "`zip`=?,"
											    + "`addr1`=?,"
											    + "`addr2`=?,"
											    + "`regip`=?,"
											  	+ "`rdate`=NOW();";
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `JBOARD_ARTICLE` SET `hit` = `hit` + 1 WHERE `seq` = ?;";
	
	public static final String UPDATE_ARTICLE_COMMENT = "UPDATE `JBOARD_ARTICLE` SET `comment` = `comment` + 1 WHERE `seq` = ?;";
	
}

