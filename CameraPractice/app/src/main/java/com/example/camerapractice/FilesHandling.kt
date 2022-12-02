package com.example.camerapractice

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import com.example.camerapractice.R.id
import com.example.camerapractice.R.id.createbtn
import com.example.camerapractice.R.id.editText
import java.io.File

class FilesHandling : AppCompatActivity() {
    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        lateinit var editText: EditText
        lateinit var createbtn1 : Button
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_files_handling)
        editText = findViewById(id.editText)
        createbtn1 = findViewById(createbtn)

        createbtn1.setOnClickListener {

        }
    }

}