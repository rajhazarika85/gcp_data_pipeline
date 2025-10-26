from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
from google.cloud import storage
import pandas as pd
import io

# ---- Config ----
GCS_BUCKET = "de-project-473910-marketing-data"  # 🔁 your bucket name
GCS_FILE = "marketing/raw/marketing_data.csv"             # 🔁 path to your CSV file

def read_and_print_csv():
    """Read CSV from GCS and print its contents."""
    client = storage.Client()
    bucket = client.bucket(GCS_BUCKET)
    blob = bucket.blob(GCS_FILE)

    data = blob.download_as_text()
    df = pd.read_csv(io.StringIO(data))

    print("✅ File read successfully!")
    print("📄 Columns:", list(df.columns))
    print("📊 Data Preview:\n", df.head())

# ---- DAG Definition ----
with DAG(
    dag_id="gcs_pandas_dag",
    schedule_interval=None,  # Run manually
    start_date=datetime(2025, 1, 1),
    catchup=False,
    tags=["gcs", "pandas"],
) as dag:

    read_gcs_task = PythonOperator(
        task_id="read_and_print_csv",
        python_callable=read_and_print_csv,
    )

    read_gcs_task
