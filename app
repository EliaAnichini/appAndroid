public class Adapter extends RecyclerView.Adapter<Adapter.MyViewHolder> {

        private ArrayList<Libro> lista;
        // Provide a reference to the views for each data item
        // Complex data items may need more than one view per item, and
        // you provide access to all the views for a data item in a view holder

        // Provide a suitable constructor (depends on the kind of dataset)
        public Adapter(ArrayList<Libro> arrayList) {
            this.lista = arrayList;

        }

        // Create new views (invoked by the layout manager)
        @Override
        public MyViewHolder onCreateViewHolder(ViewGroup parent,
                                                       int viewType) {
            // create a new view
            View v = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.recycler_libro, parent, false);

            return new MyViewHolder(v);
        }

        // Replace the contents of a view (invoked by the layout manager)
        @Override
        public void onBindViewHolder(MyViewHolder holder, int position) {
            // - get element from your dataset at this position
            // - replace the contents of the view with that element
                Libro libro = lista.get(position);

                TextView nomeAutore;
                TextView nomeLibro;
                TextView nomeEditore;
                CheckBox isRead;

                nomeAutore = holder.textViewAutore;
                nomeAutore.setText(libro.getAutore());
                nomeLibro = holder.textViewLibro;
                nomeLibro.setText(libro.getNome());
                nomeEditore = holder.textViewEditore;
                nomeEditore.setText(libro.getEditore());

                isRead = holder.checkBoxLibro;

                if(libro.isRead()){
                    isRead.setChecked(true);
                }else{
                    isRead.setChecked(false);
                }


        }

        // Return the size of your dataset (invoked by the layout manager)
        @Override
        public int getItemCount() {
            return lista.size();
        }

    public static class MyViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        TextView textViewAutore;
        TextView textViewLibro;
        TextView textViewEditore;
        CheckBox checkBoxLibro;

        public MyViewHolder(View v) {
            super(v);
            textViewLibro = itemView.findViewById(R.id.nomeLibro);
            textViewAutore = itemView.findViewById(R.id.autoreLibro);
            textViewEditore = itemView.findViewById(R.id.editore);
            checkBoxLibro = itemView.findViewById(R.id.checkboxLibro);
        }
    }

}
public class Gestore {

    private static Gestore instance;
    private ArrayList<Libro> libri;
    private ArrayList<User> users;


    public static synchronized Gestore getInstance(){
        if(instance == null){
            instance = new Gestore();
        }
        return instance;
    }
    private Gestore(){}

    public ArrayList<Libro> getLibri() {
        return libri;
    }

    public void setLibri(ArrayList<Libro> libri) {
        this.libri = libri;
    }

    public ArrayList<User> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }

    public void addLibro(Libro libro){
        libri.add(libro);
    }
    public void addUser(User user){
        users.add(user);
    }
    public void removeLibro(Libro libro){
        libri.remove(libro);
    }
    public void removeUser(User user){
        users.remove(user);
    }
    public void checkLibro(Libro libro){
        libri.contains(libro);
    }
    public void checkUser(User user){
        users.contains(user);
    }

    public boolean userPresente(String email,String password){
        boolean r = false;
        if(users.isEmpty()){
            return r;
        }
        for (int i=0; i<users.size(); i++){

            String e = users.get(i).getEmail();
            String p = users.get(i).getPassword();
            if(email.equals(e) && password.equals(p)){
                r = true;
                break;
            }
        }

        return r;
    }

    public boolean RegUserPresente(String email){
        boolean r = true;
        for (int i=0; i<users.size(); i++){
            String e = users.get(i).getEmail();
            if(email.equals(e)){
                r = false;
                break;
            }
        }

        return r;
    }
    public int getID(String email) {
        for (User u : users){
            if (u.getEmail().toLowerCase().equals(email)){
                return u.getId();
            }
        }
        return 0;
    }
    public int newId(){
        int maxID = 0;
        int currentID = 0;
        for (User u : users){
            currentID = u.getId();
            if (currentID >= maxID){
                maxID = currentID;
            }
        }
        maxID = currentID + 1;
        return maxID;
    }

    public void init(){
        libri = new ArrayList<Libro>();
        users = new ArrayList<User>();
        User user1 = new User("Elia","Anichini","eliaanichini","qwerty",1);
        User user2 = new User("Utente2","User","useruser","1234",2);
        Libro libro1 = new Libro("Libro1","123456","autore1","editore1",1,1,true);
        Libro libro2 = new Libro("Libro2","154321","Autore2", "editore2",2,2,false);
        Libro libro3 = new Libro("Libro3","8901","Autore3","editore3",3,2,true);
        Libro libro4 = new Libro("Libro4","4321","Autore4","editore4",4,1,false);
        Libro libro5 = new Libro("Libro5","4678","autore5","editore5",5,2,true);
        Libro libro6 = new Libro("Libro6","5975","Autore6", "editore6",6,1,false);
        Libro libro7 = new Libro("Libro7","19053","Autore7","editore7",7,2,true);
        Libro libro8 = new Libro("Libro8","16479","Autore8","editore8",8,1,false);

        addUser(user1);
        addUser(user2);
        addLibro(libro1);
        addLibro(libro2);
        addLibro(libro3);
        addLibro(libro4);
        addLibro(libro5);
        addLibro(libro6);
        addLibro(libro7);
        addLibro(libro8);
    }




}
public class Libro {
    private static int counter = 0;
    private String nome,isbn,autore,editore;
    private int user_id;
    private int id;
    private boolean isRead;

    public Libro(String nome, String isbn, String autore,String editore,int id,int user_id,boolean isRead) {
        counter++;
        this.id = counter;
        this.nome = nome;
        this.isbn = isbn;
        this.autore = autore;
        this.editore = editore;
        this.user_id = user_id;
        this.isRead = isRead;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getAutore() {
        return autore;
    }

    public void setAutore(String autore) {
        this.autore = autore;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }

    public String getEditore() {
        return editore;
    }

    public void setEditore(String editore) {
        this.editore = editore;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

}
public class Login extends AppCompatActivity {

    private EditText email, password;
    private Button login;

    private Gestore gestore;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        email = (EditText) findViewById(R.id.email);
        password = (EditText) findViewById(R.id.password);

        login = (Button) findViewById(R.id.login);


        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String Email = email.getText().toString();
                String Password = password.getText().toString();

                //User user = new User(Email, Password);

                if (Gestore.getInstance().userPresente(Email,Password)){
                    //utente presente

                    mostraMessaggio("Welcome",Email);
                    Intent intent = new Intent(
                            Login.this,
                            MainActivity.class);
                    int id = Gestore.getInstance().getID(Email);
                    intent.putExtra("id", id);
                    startActivity(intent);
                    finish();
                }else{
                    //utente non trovato
                    mostraMessaggio("Errore","Utente non trovato");
                }


            }
        });

    }
    public void mostraMessaggio(String titolo, String messaggio){
        android.app.AlertDialog alertDialog = new android.app.AlertDialog.Builder(Login.this).create();
        alertDialog.setTitle(titolo);
        alertDialog.setMessage(messaggio);
        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
        alertDialog.show();
    }
    public void goToRegistrazione(View view) {
        Intent i = new Intent(getApplicationContext(), Registrazione.class);
        startActivity(i);
    }
}

public class MainActivity extends AppCompatActivity {

    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private Adapter adapter;
    private ArrayList<Libro> listaLibri;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Gestore.getInstance().init();
        listaLibri = Gestore.getInstance().getLibri();



        //ArrayList<Libro> listaLibri = Gestore.getInstance().getLibri();
        ArrayList<Libro> listaLibri = new ArrayList<Libro>();
        Intent intent = getIntent();
        int id = intent.getIntExtra("id", 0);
        for (Libro l : Gestore.getInstance().getLibri()){
            if (l.getUser_id() == id){
                listaLibri.add(l);
            }
        }

        // use this setting to improve performance if you know that changes
        // in content do not change the layout size of the RecyclerView
        recyclerView = (RecyclerView) findViewById(R.id.recycler_view);
        recyclerView.setHasFixedSize(true);
        layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        // specify an adapter (see also next example)


        adapter = new Adapter(listaLibri);
        recyclerView.setAdapter(adapter);

    }




}
public class Registrazione extends AppCompatActivity {

    private EditText nome,cognome,email,password,rpassword;

    private Button registrazione;

    private Gestore gestore;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registrazione);
        getSupportActionBar().hide();
        Gestore.getInstance().init();
        nome = (EditText) findViewById(R.id.nome);
        cognome = (EditText) findViewById(R.id.cognome);
        email = (EditText) findViewById(R.id.email);
        password = (EditText) findViewById(R.id.password);
        rpassword = (EditText) findViewById(R.id.repeat_password);

        registrazione = (Button) findViewById(R.id.registrazione);


        registrazione.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String Nome = nome.getText().toString();
                String Cognome = cognome.getText().toString();
                String Email = email.getText().toString();
                String Password = password.getText().toString();
                String Rpassword = rpassword.getText().toString();

                if (Gestore.getInstance().RegUserPresente(Email)) {
                    if (Password.equals(Rpassword)) {
                        int id = Gestore.getInstance().newId();
                        User user = new User(Nome, Cognome, Email, Password,id);
                        Gestore.getInstance().addUser(user);

                        Intent intent = new Intent(
                                Registrazione.this,
                                Login.class);

                        startActivity(intent);
                        finish();

                    } else {
                        mostraMessaggio("Errore", "password Differenti");
                        return;
                    }
                } else {
                    mostraMessaggio("Errore", "utente già presente");
                }
            }
        });


    }


    public void goToLogin(View view) {
        Intent i = new Intent(getApplicationContext(), Login.class);
        startActivity(i);
    }
    public void mostraMessaggio(String titolo, String messaggio){
        AlertDialog alertDialog = new AlertDialog.Builder(Registrazione.this).create();
        alertDialog.setTitle(titolo);
        alertDialog.setMessage(messaggio);
        alertDialog.setButton(AlertDialog.BUTTON_NEUTRAL, "OK",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
        alertDialog.show();
    }



}
public class User {

    private String nome,cognome,email,password;
    private int id;

    public User (String nome,String cognome,String email,String password,int id){
        this.nome = nome;
        this.cognome = cognome;
        this.email = email;
        this.password = password;
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#C0C0C0"
    tools:context=".Login">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:orientation="vertical"
        android:paddingLeft="20dp"
        android:layout_marginTop="40dp"
        android:paddingRight="20dp" >

    <EditText
        android:id="@+id/email"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:ems="10"
        android:hint="Email" />

    <EditText
        android:id="@+id/password"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:ems="10"
        android:inputType="textPassword"
        android:hint="Password" />

        <Button android:id="@+id/login"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:text="Login"
            android:background="#283747"
            android:layout_marginTop="40dp"
            android:textColor="@android:color/white"/>

        <Button android:id="@+id/registrazione"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:text="Registrati"
            android:onClick="goToRegistrazione"
            android:background="#BA4A00"
            android:layout_marginTop="40dp"
            android:textColor="@android:color/white"/>

        </LinearLayout>

</LinearLayout>

<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/recycler_view"
        android:layout_width="match_parent"
        android:layout_height="match_parent"/>

<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#F9E79F"
    tools:context=".Registrazione">


    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_gravity="top"
        android:orientation="vertical"
        android:paddingLeft="20dp"
        android:layout_marginTop="40dp"
        android:paddingRight="20dp" >

        <TextView
            android:layout_width="100dp"
            android:layout_height="100dp"
            android:paddingTop="50dp"
            android:layout_gravity="center"
            android:textStyle="bold"
            android:textSize="20dp"
            android:textColor="#800000"
            android:text="@string/app_name"
            ></TextView>


            <EditText
                android:id="@+id/nome"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:ems="10"
                android:hint="Name"/>

            <EditText
                android:id="@+id/cognome"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:ems="10"
                android:hint="Cognome"/>

            <EditText
                android:id="@+id/email"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:ems="10"
                android:hint="Email"/>
        <EditText
            android:id="@+id/password"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:ems="10"
            android:inputType="textPassword"
            android:hint="Password" />

        <EditText
            android:id="@+id/repeat_password"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:ems="10"
            android:inputType="textPassword"
            android:hint="Repeat Password" />

        <Button android:id="@+id/registrazione"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:text="Registrati"
            android:background="#283747"
            android:layout_marginTop="40dp"
            android:textColor="@android:color/white"/>

        <Button android:id="@+id/login"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:text="Login"
            android:onClick="goToLogin"
            android:background="#BA4A00"
            android:layout_marginTop="40dp"
            android:textColor="@android:color/white"/>
    </LinearLayout>


</LinearLayout>
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="horizontal" android:layout_width="match_parent"
    android:layout_height="wrap_content"

    >

    <RelativeLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@color/primary"
        android:id="@+id/relative"
        android:layout_gravity="center"
        android:layout_margin="10dp"

        >
        <TextView
            android:id="@+id/nomeLibro"
            android:layout_width="wrap_content"
            android:layout_height="25dp"
            android:layout_marginLeft="20dp"
            android:textColor="#ffffff"
            ></TextView>

        <TextView
            android:id="@+id/autoreLibro"
            android:layout_width="wrap_content"
            android:layout_height="25dp"
            android:layout_marginLeft="20dp"
            android:textColor="#ffffff"
            android:layout_below="@+id/nomeLibro"
            ></TextView>

        <TextView
            android:id="@+id/editore"
            android:layout_width="wrap_content"
            android:layout_height="25dp"
            android:layout_marginLeft="20dp"
            android:textColor="#ffffff"
            android:layout_below="@+id/autoreLibro"
            ></TextView>

        <CheckBox
            android:id="@+id/checkboxLibro"
            android:layout_width="100dp"
            android:layout_height="50dp"
            android:layout_alignParentRight="true"
            android:layout_marginRight="15dp"
            android:layout_marginTop="10dp"
            android:text="@string/letto"
            android:layout_gravity="center"
            android:textStyle="italic"
            ></CheckBox>
</RelativeLayout>


</LinearLayout>

<resources>
    <color name="colorPrimary">#008577</color>
    <color name="colorPrimaryDark">#00574B</color>
    <color name="colorAccent">#D81B60</color>
    <color name="primary">#2C3E50</color>
</resources>


</LinearLayout>

    <string name="letto">letto</string>
