import psycopg2

def conectar_db():
    try:
        conexion = psycopg2.connect(
            dbname="SRSO3",
            user="postgres",
            password="root",
            host="localhost",
            port="5432"
        )
        return conexion
    except Exception as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None

def obtener_recomendacion(tipo_uso, seguridad, rendimiento):
    conexion = conectar_db()
    if conexion:
        cursor = conexion.cursor()
        query = """
        SELECT so.nombre, so.descripcion
        FROM Sistemas_Operativos so
        JOIN Criterios_Sistemas cs ON so.id_sistema = cs.id_sistema
        JOIN Criterios c ON cs.id_criterio = c.id_criterio
        WHERE so.tipo = %s 
        AND ((c.nombre = 'Seguridad' AND cs.valor = %s)
        OR (c.nombre = 'Rendimiento' AND cs.valor = %s))
        LIMIT 1;
        """
        cursor.execute(query, (tipo_uso, seguridad, rendimiento))
        resultado = cursor.fetchone()
        cursor.close()
        conexion.close()
        return resultado
    return None

def main():
    print("Bienvenido al sistema de recomendación de sistemas operativos!")
    tipo_uso = input("Ingrese el tipo de uso (Desktop, Server, Mobile, Embedded): ")
    seguridad = input("Ingrese el nivel de seguridad deseado (Alta, Media, Baja): ")
    rendimiento = input("Ingrese el nivel de rendimiento deseado (Alto, Medio, Baja): ")

    recomendacion = obtener_recomendacion(tipo_uso, seguridad, rendimiento)

    if recomendacion:
        print(f"Recomendación: {recomendacion[0]}")
        print(f"Descripción: {recomendacion[1]}")
    else:
        print("No se encontró ninguna recomendación que cumpla con los criterios.")

if __name__ == "__main__":
    main()
