package edu.poly.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


@NamedNativeQueries({
	@NamedNativeQuery(name = "Report.random10", query = "SELECT TOP 4 * FROM Videos ORDER BY newid()", resultClass = Video.class) })

@Entity
@Table(name="Videos")
@NamedQuery(name="Video.findAll", query="SELECT v FROM Video v")
public class Video implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="VideoId")
	private String videoId;

	@Column(name="Active")
	private boolean active;

	@Column(name="Description")
	private String description;

	@Column(name="Poster")
	private String poster;

	@Column(name="Title")
	private String title;

	@Column(name="Views")
	private int views;
	
	@Column(name="Namevideo")
	private String namevideo;
	
	@Column(name="Daodien")
	private String daodien;
	
	@Column(name="Dienvien")
	private String dienvien;
	
	@Column(name="ThoiLuong")
	private String thoiluong;
	
	@Column(name="Trangthai")
	private String trangthai;
	
	@Column(name="Namsx")
	private String namsx;
	
	@Column(name="Quocgia")
	private String quocgia;
	
	@Column(name="Theloai")
	private String theloai;

	// `mappedBy` chỉ định tên trường trong đối tượng `Favorite` hoặc `Share` mà chứa thông tin về đối tượng `Video`
	@OneToMany(mappedBy="video")
	private List<Favorite> favorites;

	
	@OneToMany(mappedBy="video")
	private List<Share> shares;

	public Video() {
	}

	public String getNamevideo() {
		return namevideo;
	}

	public void setNamevideo(String namevideo) {
		this.namevideo = namevideo;
	}

	public String getVideoId() {
		return this.videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public boolean getActive() {
		return this.active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPoster() {
		return this.poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViews() {
		return this.views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public List<Favorite> getFavorites() {
		return this.favorites;
	}

	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}
	
	

	public String getDaodien() {
		return daodien;
	}

	public void setDaodien(String daodien) {
		this.daodien = daodien;
	}

	public String getDienvien() {
		return dienvien;
	}

	public void setDienvien(String dienvien) {
		this.dienvien = dienvien;
	}

	public String getThoiluong() {
		return thoiluong;
	}

	public void setThoiluong(String thoiluong) {
		this.thoiluong = thoiluong;
	}

	public String getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(String trangthai) {
		this.trangthai = trangthai;
	}

	public String getNamsx() {
		return namsx;
	}

	public void setNamsx(String namsx) {
		this.namsx = namsx;
	}

	public String getQuocgia() {
		return quocgia;
	}

	public void setQuocgia(String quocgia) {
		this.quocgia = quocgia;
	}

	public String getTheloai() {
		return theloai;
	}

	public void setTheloai(String theloai) {
		this.theloai = theloai;
	}

	public Favorite addFavorite(Favorite favorite) {
		getFavorites().add(favorite);
		favorite.setVideo(this);

		return favorite;
	}

	public Favorite removeFavorite(Favorite favorite) {
		getFavorites().remove(favorite);
		favorite.setVideo(null);

		return favorite;
	}

	public List<Share> getShares() {
		return this.shares;
	}

	public void setShares(List<Share> shares) {
		this.shares = shares;
	}

	public Share addShare(Share share) {
		getShares().add(share);
		share.setVideo(this);

		return share;
	}

	public Share removeShare(Share share) {
		getShares().remove(share);
		share.setVideo(null);

		return share;
	}

}