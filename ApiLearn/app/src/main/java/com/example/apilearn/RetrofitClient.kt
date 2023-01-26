package com.example.apilearn

import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

class RetrofitClient {
    private var retrofit : Retrofit ? = null
    private constructor() {
        var okHttpClient = OkHttpClient.Builder()
            .connectTimeout(120,TimeUnit.SECONDS)
            .readTimeout(120,TimeUnit.SECONDS)
        var baseurl = "https://www.google.com/"
        retrofit = Retrofit.Builder()
            .client(okHttpClient)
            .baseUrl(baseurl)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }
}