package com.example.simon.partiel23_03_17;

import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Created by simon on 23/03/2017.
 */

public class Adaptation extends ArrayAdapter<ClassListView> {
    private ArrayList<ClassListView> AndroidVersionList;
    private Context context;
    private int viewRes;
    private Resources res;

    public Adaptation(Context context, int TextViewResourceId, ArrayList<ClassListView> versions) {
        super(context, TextViewResourceId, versions);
        this.AndroidVersionList = versions;
        this.context = context;
        this.viewRes = TextViewResourceId;
        this.res = context.getResources();

    }

    public int getCount(){

        return AndroidVersionList.size();
    }

    static class ViewHolder {
        public TextView NomProjet;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent){
        View view = convertView;
        ViewHolder holder;
        if(view == null){
            LayoutInflater layoutInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = layoutInflater.inflate(viewRes, parent, false);
            holder = new ViewHolder();
            holder.NomProjet = (TextView) view.findViewById(R.id.NomProjet);


            view.setTag(holder);
        } else{
            holder = (ViewHolder) view.getTag();
        }
        final ClassListView classListView = AndroidVersionList.get(position);
        if(classListView != null){
            final String versionName = String.format("Nom de la version : %s", classListView.getNomProjet());
            holder.NomProjet.setText(versionName);

        }
        return view;
    }
}
