PGDMP  #                	    |           SRSO    16.3    16.3 +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16731    SRSO    DATABASE     �   CREATE DATABASE "SRSO" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "SRSO";
                postgres    false            �            1259    16743 	   criterios    TABLE     �   CREATE TABLE public.criterios (
    id_criterio integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);
    DROP TABLE public.criterios;
       public         heap    postgres    false            �            1259    16742    criterios_id_criterio_seq    SEQUENCE     �   CREATE SEQUENCE public.criterios_id_criterio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.criterios_id_criterio_seq;
       public          postgres    false    218            �           0    0    criterios_id_criterio_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.criterios_id_criterio_seq OWNED BY public.criterios.id_criterio;
          public          postgres    false    217            �            1259    16752    criterios_sistemas    TABLE     �   CREATE TABLE public.criterios_sistemas (
    id_criterio_sistema integer NOT NULL,
    id_criterio integer NOT NULL,
    id_sistema integer NOT NULL
);
 &   DROP TABLE public.criterios_sistemas;
       public         heap    postgres    false            �            1259    16751 *   criterios_sistemas_id_criterio_sistema_seq    SEQUENCE     �   CREATE SEQUENCE public.criterios_sistemas_id_criterio_sistema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.criterios_sistemas_id_criterio_sistema_seq;
       public          postgres    false    220            �           0    0 *   criterios_sistemas_id_criterio_sistema_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.criterios_sistemas_id_criterio_sistema_seq OWNED BY public.criterios_sistemas.id_criterio_sistema;
          public          postgres    false    219            �            1259    16783    recomendaciones    TABLE     �   CREATE TABLE public.recomendaciones (
    id_recomendacion integer NOT NULL,
    id_sistema integer NOT NULL,
    fecha_recomendacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    razon text
);
 #   DROP TABLE public.recomendaciones;
       public         heap    postgres    false            �            1259    16782 $   recomendaciones_id_recomendacion_seq    SEQUENCE     �   CREATE SEQUENCE public.recomendaciones_id_recomendacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.recomendaciones_id_recomendacion_seq;
       public          postgres    false    224            �           0    0 $   recomendaciones_id_recomendacion_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.recomendaciones_id_recomendacion_seq OWNED BY public.recomendaciones.id_recomendacion;
          public          postgres    false    223            �            1259    16769 
   requisitos    TABLE     �   CREATE TABLE public.requisitos (
    id_requisito integer NOT NULL,
    id_sistema integer NOT NULL,
    cpu character varying(100),
    ram character varying(100),
    almacenamiento character varying(100),
    otros text
);
    DROP TABLE public.requisitos;
       public         heap    postgres    false            �            1259    16768    requisitos_id_requisito_seq    SEQUENCE     �   CREATE SEQUENCE public.requisitos_id_requisito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.requisitos_id_requisito_seq;
       public          postgres    false    222            �           0    0    requisitos_id_requisito_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.requisitos_id_requisito_seq OWNED BY public.requisitos.id_requisito;
          public          postgres    false    221            �            1259    16733    sistemas_operativos    TABLE     �  CREATE TABLE public.sistemas_operativos (
    id_sistema integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    fabricante character varying(100),
    tipo character varying(10),
    fecha_lanzamiento date,
    caracteristicas text,
    CONSTRAINT sistemas_operativos_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['Desktop'::character varying, 'Server'::character varying, 'Mobile'::character varying, 'Embedded'::character varying])::text[])))
);
 '   DROP TABLE public.sistemas_operativos;
       public         heap    postgres    false            �            1259    16732 "   sistemas_operativos_id_sistema_seq    SEQUENCE     �   CREATE SEQUENCE public.sistemas_operativos_id_sistema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.sistemas_operativos_id_sistema_seq;
       public          postgres    false    216            �           0    0 "   sistemas_operativos_id_sistema_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.sistemas_operativos_id_sistema_seq OWNED BY public.sistemas_operativos.id_sistema;
          public          postgres    false    215            /           2604    16746    criterios id_criterio    DEFAULT     ~   ALTER TABLE ONLY public.criterios ALTER COLUMN id_criterio SET DEFAULT nextval('public.criterios_id_criterio_seq'::regclass);
 D   ALTER TABLE public.criterios ALTER COLUMN id_criterio DROP DEFAULT;
       public          postgres    false    218    217    218            0           2604    16755 &   criterios_sistemas id_criterio_sistema    DEFAULT     �   ALTER TABLE ONLY public.criterios_sistemas ALTER COLUMN id_criterio_sistema SET DEFAULT nextval('public.criterios_sistemas_id_criterio_sistema_seq'::regclass);
 U   ALTER TABLE public.criterios_sistemas ALTER COLUMN id_criterio_sistema DROP DEFAULT;
       public          postgres    false    220    219    220            2           2604    16786     recomendaciones id_recomendacion    DEFAULT     �   ALTER TABLE ONLY public.recomendaciones ALTER COLUMN id_recomendacion SET DEFAULT nextval('public.recomendaciones_id_recomendacion_seq'::regclass);
 O   ALTER TABLE public.recomendaciones ALTER COLUMN id_recomendacion DROP DEFAULT;
       public          postgres    false    224    223    224            1           2604    16772    requisitos id_requisito    DEFAULT     �   ALTER TABLE ONLY public.requisitos ALTER COLUMN id_requisito SET DEFAULT nextval('public.requisitos_id_requisito_seq'::regclass);
 F   ALTER TABLE public.requisitos ALTER COLUMN id_requisito DROP DEFAULT;
       public          postgres    false    222    221    222            .           2604    16736    sistemas_operativos id_sistema    DEFAULT     �   ALTER TABLE ONLY public.sistemas_operativos ALTER COLUMN id_sistema SET DEFAULT nextval('public.sistemas_operativos_id_sistema_seq'::regclass);
 M   ALTER TABLE public.sistemas_operativos ALTER COLUMN id_sistema DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16743 	   criterios 
   TABLE DATA           E   COPY public.criterios (id_criterio, nombre, descripcion) FROM stdin;
    public          postgres    false    218   27       �          0    16752    criterios_sistemas 
   TABLE DATA           Z   COPY public.criterios_sistemas (id_criterio_sistema, id_criterio, id_sistema) FROM stdin;
    public          postgres    false    220   O7       �          0    16783    recomendaciones 
   TABLE DATA           c   COPY public.recomendaciones (id_recomendacion, id_sistema, fecha_recomendacion, razon) FROM stdin;
    public          postgres    false    224   l7       �          0    16769 
   requisitos 
   TABLE DATA           _   COPY public.requisitos (id_requisito, id_sistema, cpu, ram, almacenamiento, otros) FROM stdin;
    public          postgres    false    222   �7       �          0    16733    sistemas_operativos 
   TABLE DATA           �   COPY public.sistemas_operativos (id_sistema, nombre, descripcion, fabricante, tipo, fecha_lanzamiento, caracteristicas) FROM stdin;
    public          postgres    false    216   �7       �           0    0    criterios_id_criterio_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.criterios_id_criterio_seq', 1, false);
          public          postgres    false    217            �           0    0 *   criterios_sistemas_id_criterio_sistema_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.criterios_sistemas_id_criterio_sistema_seq', 1, false);
          public          postgres    false    219            �           0    0 $   recomendaciones_id_recomendacion_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.recomendaciones_id_recomendacion_seq', 1, false);
          public          postgres    false    223            �           0    0    requisitos_id_requisito_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.requisitos_id_requisito_seq', 1, false);
          public          postgres    false    221            �           0    0 "   sistemas_operativos_id_sistema_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.sistemas_operativos_id_sistema_seq', 1, false);
          public          postgres    false    215            8           2606    16750    criterios criterios_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.criterios
    ADD CONSTRAINT criterios_pkey PRIMARY KEY (id_criterio);
 B   ALTER TABLE ONLY public.criterios DROP CONSTRAINT criterios_pkey;
       public            postgres    false    218            :           2606    16757 *   criterios_sistemas criterios_sistemas_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.criterios_sistemas
    ADD CONSTRAINT criterios_sistemas_pkey PRIMARY KEY (id_criterio_sistema);
 T   ALTER TABLE ONLY public.criterios_sistemas DROP CONSTRAINT criterios_sistemas_pkey;
       public            postgres    false    220            >           2606    16791 $   recomendaciones recomendaciones_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_pkey PRIMARY KEY (id_recomendacion);
 N   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_pkey;
       public            postgres    false    224            <           2606    16776    requisitos requisitos_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.requisitos
    ADD CONSTRAINT requisitos_pkey PRIMARY KEY (id_requisito);
 D   ALTER TABLE ONLY public.requisitos DROP CONSTRAINT requisitos_pkey;
       public            postgres    false    222            6           2606    16741 ,   sistemas_operativos sistemas_operativos_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.sistemas_operativos
    ADD CONSTRAINT sistemas_operativos_pkey PRIMARY KEY (id_sistema);
 V   ALTER TABLE ONLY public.sistemas_operativos DROP CONSTRAINT sistemas_operativos_pkey;
       public            postgres    false    216            ?           2606    16758 6   criterios_sistemas criterios_sistemas_id_criterio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criterios_sistemas
    ADD CONSTRAINT criterios_sistemas_id_criterio_fkey FOREIGN KEY (id_criterio) REFERENCES public.criterios(id_criterio);
 `   ALTER TABLE ONLY public.criterios_sistemas DROP CONSTRAINT criterios_sistemas_id_criterio_fkey;
       public          postgres    false    220    218    4664            @           2606    16763 5   criterios_sistemas criterios_sistemas_id_sistema_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criterios_sistemas
    ADD CONSTRAINT criterios_sistemas_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES public.sistemas_operativos(id_sistema);
 _   ALTER TABLE ONLY public.criterios_sistemas DROP CONSTRAINT criterios_sistemas_id_sistema_fkey;
       public          postgres    false    4662    220    216            B           2606    16792 /   recomendaciones recomendaciones_id_sistema_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES public.sistemas_operativos(id_sistema);
 Y   ALTER TABLE ONLY public.recomendaciones DROP CONSTRAINT recomendaciones_id_sistema_fkey;
       public          postgres    false    4662    216    224            A           2606    16777 %   requisitos requisitos_id_sistema_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requisitos
    ADD CONSTRAINT requisitos_id_sistema_fkey FOREIGN KEY (id_sistema) REFERENCES public.sistemas_operativos(id_sistema);
 O   ALTER TABLE ONLY public.requisitos DROP CONSTRAINT requisitos_id_sistema_fkey;
       public          postgres    false    222    4662    216            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     