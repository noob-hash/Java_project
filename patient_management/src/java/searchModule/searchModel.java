/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package searchModule;

/**
 *
 * @author Subin
 */
public class searchModel {
    private String searchName;
    private int searchId;
    private String searchDep;

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }

    public searchModel(int searchId) {
        this.searchId = searchId;
    }

    public void setSearchDep(String searchDep) {
        this.searchDep = searchDep;
    }

    public String getSearchName() {
        return searchName;
    }

    public int getSearchId() {
        return searchId;
    }

    public String getSearchDep() {
        return searchDep;
    }
}
