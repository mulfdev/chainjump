use axum::{response::Json, routing::get, Router};

use serde_json::{json, Value};

async fn root() -> Json<Value> {
    Json(json!({"data": 42}))
}

#[tokio::main]
async fn main() {
    let app = Router::new().route("/", get(root));
    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();

    println!("server running on port 3k");
    axum::serve(listener, app).await.unwrap();
}
