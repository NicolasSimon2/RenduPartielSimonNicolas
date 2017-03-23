package com.example.simon.partiel23_03_17;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;

/**
 * Created by simon on 23/03/2017.
 */

public class PageProjetClass extends Activity {
    ArrayList<ClassListView> AndroidList = new
    ArrayList<ClassListView>();

    Context ctx = this;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.page_projet);

        BackGround b = new BackGround();
        b.execute();



        initList(AndroidList);
        final Adaptation adapter = new Adaptation(this,R.layout.projet_list,AndroidList);
        final ListView MaList = (ListView) findViewById(R.id.MaListe);
        MaList.setAdapter(adapter);
        MaList.setOnItemClickListener(new AdapterView.OnItemClickListener(){

            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                ClassListView SelectedItems = (ClassListView)adapterView.getItemAtPosition(i);
                Toast.makeText(getApplicationContext(),SelectedItems.getNomProjet(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    class BackGround extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... params) {
            String LoginS = params[0];
            String MDPS = params[1];
            String data = "";
            int tmp;

            try {
                URL url = new URL("http://10.0.2.2/myportablefiles/rest/ChargerProjet.php");

                HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
                httpURLConnection.setDoOutput(true);
                OutputStream os = httpURLConnection.getOutputStream();
                os.flush();
                os.close();

                InputStream is = httpURLConnection.getInputStream();
                while ((tmp = is.read()) != -1) {
                    data += (char) tmp;
                }

                is.close();
                httpURLConnection.disconnect();

                return data;
            } catch (MalformedURLException e) {
                e.printStackTrace();
                return "Exception: " + e.getMessage();
            } catch (IOException e) {
                e.printStackTrace();
                return "Exception: " + e.getMessage();
            }
        }

        @Override
        protected void onPostExecute(String s) {
            String err = null;
            try {
                JSONObject root = new JSONObject(s);
                JSONObject user_data = root.getJSONObject("user_data");
                IDP = user_data.getString("ID_UTILISATEUR");
            } catch (JSONException e) {
                e.printStackTrace();
                err = "Exception: " + e.getMessage();
            }

            Intent i = new Intent(ctx, PageProjetClass.class);
            i.putExtra("ID", IDP);
            i.putExtra("err", err);
            startActivity(i);


        }
    }

    public void initList(ArrayList<ClassListView> androidList){
        ClassListView version_1 = new ClassListView();


       /*version_1.setVersionName("Cupcake");
        version_1.setVersionNum("1.0");
        version_1.setImageName("soleil");

        androidList.add(version_1);


        ClassListView version_2 = new ClassListView();

        version_2.setVersionName("cake");
        version_2.setVersionNum("2.0");
        version_2.setImageName("terre");


        androidList.add(version_2);*/

    } ;
}
