import random
import datetime
import string

def generar_user_id():
    return ''.join(random.choices('ABCDEF0123456789', k=16))  # Hash hexadecimal de 16 caracteres

def generar_timestamp():
    ahora = datetime.datetime.now()
    return ahora.strftime('%y%m%d%H%M%S')  # Formato: YYMMDDHHMMSS

# Algunas queries de ejemplo
queries = ['foods', 'yahoo chat', 'news', 'weather', 'buy laptop', 'google maps']

# Número de registros
num_logs = 10000

# Archivo de salida
archivo_log = "usuarios.log"

with open(archivo_log, 'w', encoding='utf-8') as f:
    for _ in range(num_logs):
        user = generar_user_id()
        time = generar_timestamp()
        query = random.choice(queries)
        f.write(f"{user}\t{time}\t{query}\n")

print(f"Archivo {archivo_log} generado con {num_logs} registros.")
