package com.example.simon.partiel23_03_17;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class MainActivity extends AppCompatActivity {

    Button OK;
    EditText Login, MDP;
    String LoginS, MDPS;
    String IDP=null;

    Context ctx = this;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Login = (EditText) findViewById(R.id.Login);
        MDP = (EditText) findViewById(R.id.MDP);
        OK = (Button) findViewById(R.id.OK);

    }

    public void main_login(View v){
        LoginS = Login.getText().toString();
        MDPS = MDP.getText().toString();
        BackGround b = new BackGround();
        b.execute(LoginS, MDPS);
    }

    class BackGround extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... params) {
            String LoginS = params[0];
            String MDPS = params[1];
            String data = "";
            int tmp;

            try {
                URL url = new URL("http://10.0.2.2/myportablefiles/rest/Login.php?login=" + LoginS + "&password=" + MDPS);

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
            String err=null;
            try {
                JSONObject root = new JSONObject(s);
                JSONObject user_data = root.getJSONObject("user_data");
                IDP = user_data.getString("ID_UTILISATEUR");
            } catch (JSONException e) {
                e.printStackTrace();
                err = "Exception: "+e.getMessage();
            }

            Intent i = new Intent(ctx, PageProjetClass.class);
            i.putExtra("ID", IDP);
            i.putExtra("err", err);
            startActivity(i);



        }
    }
}
