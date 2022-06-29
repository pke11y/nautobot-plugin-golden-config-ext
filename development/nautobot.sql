--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO nautobot;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO nautobot;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO nautobot;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO nautobot;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO nautobot;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO nautobot;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    id uuid NOT NULL,
    config_data jsonb NOT NULL
);


ALTER TABLE public.auth_user OWNER TO nautobot;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO nautobot;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO nautobot;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO nautobot;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO nautobot;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_circuit (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    cid character varying(100) NOT NULL,
    install_date date,
    commit_rate integer,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id uuid NOT NULL,
    status_id uuid,
    tenant_id uuid,
    type_id uuid NOT NULL,
    termination_a_id uuid,
    termination_z_id uuid,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO nautobot;

--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_circuittermination (
    id uuid NOT NULL,
    _cable_peer_id uuid,
    term_side character varying(1) NOT NULL,
    port_speed integer,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    circuit_id uuid NOT NULL,
    site_id uuid,
    provider_network_id uuid,
    _custom_field_data jsonb NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO nautobot;

--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_circuittype (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO nautobot;

--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_provider (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    asn bigint,
    account character varying(100) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO nautobot;

--
-- Name: circuits_providernetwork; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_providernetwork (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id uuid NOT NULL
);


ALTER TABLE public.circuits_providernetwork OWNER TO nautobot;

--
-- Name: constance_config; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.constance_config (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.constance_config OWNER TO nautobot;

--
-- Name: constance_config_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.constance_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constance_config_id_seq OWNER TO nautobot;

--
-- Name: constance_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.constance_config_id_seq OWNED BY public.constance_config.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_cable (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    termination_a_id uuid NOT NULL,
    termination_b_id uuid NOT NULL,
    type character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length smallint,
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    _termination_a_device_id uuid,
    _termination_b_device_id uuid,
    status_id uuid,
    termination_a_type_id integer NOT NULL,
    termination_b_type_id integer NOT NULL,
    CONSTRAINT dcim_cable_length_check CHECK ((length >= 0))
);


ALTER TABLE public.dcim_cable OWNER TO nautobot;

--
-- Name: dcim_cablepath; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_cablepath (
    id uuid NOT NULL,
    origin_id uuid NOT NULL,
    destination_id uuid,
    path jsonb NOT NULL,
    is_active boolean NOT NULL,
    is_split boolean NOT NULL,
    destination_type_id integer,
    origin_type_id integer NOT NULL
);


ALTER TABLE public.dcim_cablepath OWNER TO nautobot;

--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL
);


ALTER TABLE public.dcim_consoleport OWNER TO nautobot;

--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id uuid NOT NULL
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO nautobot;

--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleserverport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL
);


ALTER TABLE public.dcim_consoleserverport OWNER TO nautobot;

--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id uuid NOT NULL
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO nautobot;

--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_device (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    local_context_data jsonb,
    local_context_data_owner_object_id uuid,
    name character varying(64),
    _name character varying(100),
    serial character varying(255) NOT NULL,
    asset_tag character varying(50),
    "position" smallint,
    face character varying(50) NOT NULL,
    vc_position smallint,
    vc_priority smallint,
    comments text NOT NULL,
    cluster_id uuid,
    device_role_id uuid NOT NULL,
    device_type_id uuid NOT NULL,
    local_context_data_owner_content_type_id integer,
    platform_id uuid,
    primary_ip4_id uuid,
    primary_ip6_id uuid,
    rack_id uuid,
    site_id uuid NOT NULL,
    status_id uuid,
    tenant_id uuid,
    virtual_chassis_id uuid,
    local_context_schema_id uuid,
    secrets_group_id uuid,
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO nautobot;

--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicebay (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_id uuid NOT NULL,
    installed_device_id uuid
);


ALTER TABLE public.dcim_devicebay OWNER TO nautobot;

--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicebaytemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id uuid NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO nautobot;

--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicerole (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO nautobot;

--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicetype (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    model character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    comments text NOT NULL,
    manufacturer_id uuid NOT NULL,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO nautobot;

--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_frontport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id uuid,
    device_id uuid NOT NULL,
    rear_port_id uuid NOT NULL,
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO nautobot;

--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_frontporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id uuid NOT NULL,
    rear_port_id uuid NOT NULL,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO nautobot;

--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interface (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    enabled boolean NOT NULL,
    mac_address character varying(18),
    mtu integer,
    mode character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    lag_id uuid,
    untagged_vlan_id uuid,
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO nautobot;

--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id bigint NOT NULL,
    interface_id uuid NOT NULL,
    vlan_id uuid NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO nautobot;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO nautobot;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interfacetemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id uuid NOT NULL
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO nautobot;

--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_inventoryitem (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(255) NOT NULL,
    asset_tag character varying(50),
    discovered boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    device_id uuid NOT NULL,
    manufacturer_id uuid,
    parent_id uuid,
    CONSTRAINT dcim_inventoryitem_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitem OWNER TO nautobot;

--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_manufacturer (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO nautobot;

--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_platform (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    napalm_args jsonb,
    description character varying(200) NOT NULL,
    manufacturer_id uuid
);


ALTER TABLE public.dcim_platform OWNER TO nautobot;

--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerfeed (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    _cable_peer_id uuid,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    supply character varying(50) NOT NULL,
    phase character varying(50) NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power integer NOT NULL,
    comments text NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    power_panel_id uuid NOT NULL,
    rack_id uuid,
    status_id uuid,
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO nautobot;

--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_poweroutlet (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    power_port_id uuid
);


ALTER TABLE public.dcim_poweroutlet OWNER TO nautobot;

--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_poweroutlettemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    device_type_id uuid NOT NULL,
    power_port_id uuid
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO nautobot;

--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerpanel (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    rack_group_id uuid,
    site_id uuid NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO nautobot;

--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO nautobot;

--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    device_type_id uuid NOT NULL,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO nautobot;

--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rack (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    facility_id character varying(50),
    serial character varying(255) NOT NULL,
    asset_tag character varying(50),
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    u_height smallint NOT NULL,
    desc_units boolean NOT NULL,
    outer_width smallint,
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    comments text NOT NULL,
    group_id uuid,
    role_id uuid,
    site_id uuid NOT NULL,
    status_id uuid,
    tenant_id uuid,
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO nautobot;

--
-- Name: dcim_rackgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rackgroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id uuid,
    site_id uuid NOT NULL,
    CONSTRAINT dcim_rackgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_rackgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_rackgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_rackgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_rackgroup OWNER TO nautobot;

--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rackreservation (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    units jsonb NOT NULL,
    description character varying(200) NOT NULL,
    rack_id uuid NOT NULL,
    tenant_id uuid,
    user_id uuid NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO nautobot;

--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rackrole (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO nautobot;

--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rearport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id uuid,
    device_id uuid NOT NULL,
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO nautobot;

--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rearporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id uuid NOT NULL,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO nautobot;

--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_region (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id uuid,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO nautobot;

--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_site (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    facility character varying(50) NOT NULL,
    asn bigint,
    time_zone character varying(63) NOT NULL,
    description character varying(200) NOT NULL,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    contact_name character varying(50) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    contact_email character varying(254) NOT NULL,
    comments text NOT NULL,
    region_id uuid,
    status_id uuid,
    tenant_id uuid
);


ALTER TABLE public.dcim_site OWNER TO nautobot;

--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_virtualchassis (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    domain character varying(30) NOT NULL,
    master_id uuid
);


ALTER TABLE public.dcim_virtualchassis OWNER TO nautobot;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id uuid NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO nautobot;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO nautobot;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO nautobot;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO nautobot;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO nautobot;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO nautobot;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO nautobot;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO nautobot;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO nautobot;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO nautobot;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO nautobot;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO nautobot;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO nautobot;

--
-- Name: extras_computedfield; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_computedfield (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    slug character varying(100) NOT NULL,
    label character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template text NOT NULL,
    fallback_value character varying(500) NOT NULL,
    weight smallint NOT NULL,
    content_type_id integer NOT NULL,
    advanced_ui boolean NOT NULL,
    CONSTRAINT extras_computedfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_computedfield OWNER TO nautobot;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    owner_object_id uuid,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    owner_content_type_id integer,
    schema_id uuid,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO nautobot;

--
-- Name: extras_configcontext_cluster_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_cluster_groups (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    clustergroup_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_groups OWNER TO nautobot;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_cluster_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_groups_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_cluster_groups_id_seq OWNED BY public.extras_configcontext_cluster_groups.id;


--
-- Name: extras_configcontext_clusters; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_clusters (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    cluster_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_clusters OWNER TO nautobot;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_clusters_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_clusters_id_seq OWNED BY public.extras_configcontext_clusters.id;


--
-- Name: extras_configcontext_device_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_device_types (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    devicetype_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_device_types OWNER TO nautobot;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_device_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_device_types_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_device_types_id_seq OWNED BY public.extras_configcontext_device_types.id;


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_platforms (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    platform_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO nautobot;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_regions (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    region_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO nautobot;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_roles (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    devicerole_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO nautobot;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_sites (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    site_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO nautobot;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tags; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_tags (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    tag_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_tags OWNER TO nautobot;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tags_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_tags_id_seq OWNED BY public.extras_configcontext_tags.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    tenantgroup_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO nautobot;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_tenants (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    tenant_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO nautobot;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_configcontextschema; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontextschema (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    data_schema jsonb NOT NULL,
    owner_object_id uuid,
    owner_content_type_id integer
);


ALTER TABLE public.extras_configcontextschema OWNER TO nautobot;

--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customfield (
    id uuid NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    required boolean NOT NULL,
    filter_logic character varying(50) NOT NULL,
    "default" jsonb,
    weight smallint NOT NULL,
    validation_minimum bigint,
    validation_maximum bigint,
    validation_regex character varying(500) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    advanced_ui boolean NOT NULL,
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO nautobot;

--
-- Name: extras_customfield_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customfield_content_types (
    id bigint NOT NULL,
    customfield_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_content_types OWNER TO nautobot;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_customfield_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_customfield_content_types_id_seq OWNED BY public.extras_customfield_content_types.id;


--
-- Name: extras_customfieldchoice; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customfieldchoice (
    id uuid NOT NULL,
    value character varying(100) NOT NULL,
    weight smallint NOT NULL,
    field_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT extras_customfieldchoice_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfieldchoice OWNER TO nautobot;

--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customlink (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    text character varying(500) NOT NULL,
    target_url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO nautobot;

--
-- Name: extras_dynamicgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_dynamicgroup (
    _custom_field_data jsonb NOT NULL,
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    filter jsonb NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE public.extras_dynamicgroup OWNER TO nautobot;

--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_exporttemplate (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    owner_object_id uuid,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    content_type_id integer NOT NULL,
    owner_content_type_id integer
);


ALTER TABLE public.extras_exporttemplate OWNER TO nautobot;

--
-- Name: extras_fileattachment; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_fileattachment (
    id uuid NOT NULL,
    bytes bytea NOT NULL,
    filename character varying(255) NOT NULL,
    mimetype character varying(50) NOT NULL
);


ALTER TABLE public.extras_fileattachment OWNER TO nautobot;

--
-- Name: extras_fileproxy; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_fileproxy (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL
);


ALTER TABLE public.extras_fileproxy OWNER TO nautobot;

--
-- Name: extras_gitrepository; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_gitrepository (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    remote_url character varying(255) NOT NULL,
    branch character varying(64) NOT NULL,
    current_head character varying(48) NOT NULL,
    _token bytea NOT NULL,
    username character varying(64) NOT NULL,
    provided_contents jsonb NOT NULL,
    secrets_group_id uuid
);


ALTER TABLE public.extras_gitrepository OWNER TO nautobot;

--
-- Name: extras_graphqlquery; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_graphqlquery (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    query text NOT NULL,
    variables jsonb NOT NULL
);


ALTER TABLE public.extras_graphqlquery OWNER TO nautobot;

--
-- Name: extras_healthchecktestmodel; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_healthchecktestmodel (
    id uuid NOT NULL,
    title character varying(128) NOT NULL
);


ALTER TABLE public.extras_healthchecktestmodel OWNER TO nautobot;

--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_imageattachment (
    id uuid NOT NULL,
    object_id uuid NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO nautobot;

--
-- Name: extras_job; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_job (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    source character varying(16) NOT NULL,
    module_name character varying(100) NOT NULL,
    job_class_name character varying(100) NOT NULL,
    slug character varying(320) NOT NULL,
    "grouping" character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    installed boolean NOT NULL,
    enabled boolean NOT NULL,
    commit_default boolean NOT NULL,
    hidden boolean NOT NULL,
    read_only boolean NOT NULL,
    approval_required boolean NOT NULL,
    soft_time_limit double precision NOT NULL,
    time_limit double precision NOT NULL,
    grouping_override boolean NOT NULL,
    name_override boolean NOT NULL,
    description_override boolean NOT NULL,
    commit_default_override boolean NOT NULL,
    hidden_override boolean NOT NULL,
    read_only_override boolean NOT NULL,
    approval_required_override boolean NOT NULL,
    soft_time_limit_override boolean NOT NULL,
    time_limit_override boolean NOT NULL,
    git_repository_id uuid
);


ALTER TABLE public.extras_job OWNER TO nautobot;

--
-- Name: extras_joblogentry; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_joblogentry (
    id uuid NOT NULL,
    log_level character varying(32) NOT NULL,
    "grouping" character varying(100) NOT NULL,
    message text NOT NULL,
    created timestamp with time zone NOT NULL,
    log_object character varying(200),
    absolute_url character varying(255),
    job_result_id uuid NOT NULL
);


ALTER TABLE public.extras_joblogentry OWNER TO nautobot;

--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_jobresult (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed timestamp with time zone,
    status character varying(30) NOT NULL,
    data jsonb,
    job_id uuid NOT NULL,
    obj_type_id integer NOT NULL,
    user_id uuid,
    _custom_field_data jsonb NOT NULL,
    schedule_id uuid,
    job_model_id uuid
);


ALTER TABLE public.extras_jobresult OWNER TO nautobot;

--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_objectchange (
    id uuid NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    changed_object_id uuid NOT NULL,
    related_object_id uuid,
    object_repr character varying(200) NOT NULL,
    object_data jsonb NOT NULL,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id uuid,
    object_data_v2 jsonb
);


ALTER TABLE public.extras_objectchange OWNER TO nautobot;

--
-- Name: extras_relationship; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_relationship (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    source_label character varying(50) NOT NULL,
    source_hidden boolean NOT NULL,
    source_filter jsonb,
    destination_label character varying(50) NOT NULL,
    destination_hidden boolean NOT NULL,
    destination_filter jsonb,
    destination_type_id integer NOT NULL,
    source_type_id integer NOT NULL,
    advanced_ui boolean NOT NULL
);


ALTER TABLE public.extras_relationship OWNER TO nautobot;

--
-- Name: extras_relationshipassociation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_relationshipassociation (
    id uuid NOT NULL,
    source_id uuid NOT NULL,
    destination_id uuid NOT NULL,
    destination_type_id integer NOT NULL,
    relationship_id uuid NOT NULL,
    source_type_id integer NOT NULL
);


ALTER TABLE public.extras_relationshipassociation OWNER TO nautobot;

--
-- Name: extras_scheduledjob; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_scheduledjob (
    id uuid NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    job_class character varying(255) NOT NULL,
    "interval" character varying(255) NOT NULL,
    args jsonb NOT NULL,
    kwargs jsonb NOT NULL,
    queue character varying(200),
    one_off boolean NOT NULL,
    start_time timestamp with time zone NOT NULL,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    approval_required boolean NOT NULL,
    approved_at timestamp with time zone,
    approved_by_user_id uuid,
    user_id uuid,
    job_model_id uuid,
    CONSTRAINT extras_scheduledjob_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.extras_scheduledjob OWNER TO nautobot;

--
-- Name: extras_scheduledjobs; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_scheduledjobs (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.extras_scheduledjobs OWNER TO nautobot;

--
-- Name: extras_secret; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_secret (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    provider character varying(100) NOT NULL,
    parameters jsonb NOT NULL
);


ALTER TABLE public.extras_secret OWNER TO nautobot;

--
-- Name: extras_secretsgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_secretsgroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_secretsgroup OWNER TO nautobot;

--
-- Name: extras_secretsgroupassociation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_secretsgroupassociation (
    id uuid NOT NULL,
    access_type character varying(32) NOT NULL,
    secret_type character varying(32) NOT NULL,
    group_id uuid NOT NULL,
    secret_id uuid NOT NULL
);


ALTER TABLE public.extras_secretsgroupassociation OWNER TO nautobot;

--
-- Name: extras_status; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_status (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(6) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_status OWNER TO nautobot;

--
-- Name: extras_status_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_status_content_types (
    id bigint NOT NULL,
    status_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_status_content_types OWNER TO nautobot;

--
-- Name: extras_status_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_status_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_status_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_status_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_status_content_types_id_seq OWNED BY public.extras_status_content_types.id;


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_tag (
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_tag OWNER TO nautobot;

--
-- Name: extras_tag_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_tag_content_types (
    id bigint NOT NULL,
    tag_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_tag_content_types OWNER TO nautobot;

--
-- Name: extras_tag_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_tag_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_tag_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_tag_content_types_id_seq OWNED BY public.extras_tag_content_types.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_taggeditem (
    id uuid NOT NULL,
    object_id uuid NOT NULL,
    content_type_id integer NOT NULL,
    tag_id uuid NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO nautobot;

--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_webhook (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    enabled boolean NOT NULL,
    http_method character varying(30) NOT NULL,
    http_content_type character varying(100) NOT NULL,
    additional_headers text NOT NULL,
    body_template text NOT NULL,
    secret character varying(255) NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096)
);


ALTER TABLE public.extras_webhook OWNER TO nautobot;

--
-- Name: extras_webhook_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_webhook_content_types (
    id bigint NOT NULL,
    webhook_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_content_types OWNER TO nautobot;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_webhook_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_webhook_content_types_id_seq OWNED BY public.extras_webhook_content_types.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_aggregate (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    network bytea NOT NULL,
    broadcast bytea NOT NULL,
    prefix_length integer NOT NULL,
    date_added date,
    description character varying(200) NOT NULL,
    rir_id uuid NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.ipam_aggregate OWNER TO nautobot;

--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_ipaddress (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    host bytea NOT NULL,
    broadcast bytea NOT NULL,
    prefix_length integer NOT NULL,
    role character varying(50) NOT NULL,
    assigned_object_id uuid,
    dns_name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    assigned_object_type_id integer,
    nat_inside_id uuid,
    status_id uuid,
    tenant_id uuid,
    vrf_id uuid
);


ALTER TABLE public.ipam_ipaddress OWNER TO nautobot;

--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_prefix (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    network bytea NOT NULL,
    broadcast bytea NOT NULL,
    prefix_length integer NOT NULL,
    is_pool boolean NOT NULL,
    description character varying(200) NOT NULL,
    role_id uuid,
    site_id uuid,
    status_id uuid,
    tenant_id uuid,
    vlan_id uuid,
    vrf_id uuid
);


ALTER TABLE public.ipam_prefix OWNER TO nautobot;

--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_rir (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    is_private boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO nautobot;

--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_role (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO nautobot;

--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_routetarget (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.ipam_routetarget OWNER TO nautobot;

--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_service (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    protocol character varying(50) NOT NULL,
    ports jsonb NOT NULL,
    description character varying(200) NOT NULL,
    device_id uuid,
    virtual_machine_id uuid
);


ALTER TABLE public.ipam_service OWNER TO nautobot;

--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_service_ipaddresses (
    id bigint NOT NULL,
    service_id uuid NOT NULL,
    ipaddress_id uuid NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO nautobot;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO nautobot;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vlan (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    group_id uuid,
    role_id uuid,
    site_id uuid,
    status_id uuid,
    tenant_id uuid,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO nautobot;

--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vlangroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    site_id uuid
);


ALTER TABLE public.ipam_vlangroup OWNER TO nautobot;

--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrf (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    rd character varying(21),
    enforce_unique boolean NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.ipam_vrf OWNER TO nautobot;

--
-- Name: ipam_vrf_export_targets; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrf_export_targets (
    id bigint NOT NULL,
    vrf_id uuid NOT NULL,
    routetarget_id uuid NOT NULL
);


ALTER TABLE public.ipam_vrf_export_targets OWNER TO nautobot;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.ipam_vrf_export_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_export_targets_id_seq OWNER TO nautobot;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.ipam_vrf_export_targets_id_seq OWNED BY public.ipam_vrf_export_targets.id;


--
-- Name: ipam_vrf_import_targets; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrf_import_targets (
    id bigint NOT NULL,
    vrf_id uuid NOT NULL,
    routetarget_id uuid NOT NULL
);


ALTER TABLE public.ipam_vrf_import_targets OWNER TO nautobot;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.ipam_vrf_import_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_import_targets_id_seq OWNER TO nautobot;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.ipam_vrf_import_targets_id_seq OWNED BY public.ipam_vrf_import_targets.id;


--
-- Name: nautobot_golden_config_compliancefeature; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.nautobot_golden_config_compliancefeature (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.nautobot_golden_config_compliancefeature OWNER TO nautobot;

--
-- Name: nautobot_golden_config_compliancerule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.nautobot_golden_config_compliancerule (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    description character varying(200) NOT NULL,
    config_ordered boolean NOT NULL,
    match_config text,
    config_type character varying(20) NOT NULL,
    feature_id uuid NOT NULL,
    platform_id uuid NOT NULL
);


ALTER TABLE public.nautobot_golden_config_compliancerule OWNER TO nautobot;

--
-- Name: nautobot_golden_config_configcompliance; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.nautobot_golden_config_configcompliance (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    compliance boolean,
    actual jsonb NOT NULL,
    intended jsonb NOT NULL,
    missing jsonb NOT NULL,
    extra jsonb NOT NULL,
    ordered boolean NOT NULL,
    compliance_int integer,
    device_id uuid NOT NULL,
    rule_id uuid NOT NULL
);


ALTER TABLE public.nautobot_golden_config_configcompliance OWNER TO nautobot;

--
-- Name: nautobot_golden_config_configremove; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.nautobot_golden_config_configremove (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    regex character varying(200) NOT NULL,
    platform_id uuid NOT NULL
);


ALTER TABLE public.nautobot_golden_config_configremove OWNER TO nautobot;

--
-- Name: nautobot_golden_config_configreplace; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.nautobot_golden_config_configreplace (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    regex character varying(200) NOT NULL,
    replace character varying(200) NOT NULL,
    platform_id uuid NOT NULL
);


ALTER TABLE public.nautobot_golden_config_configreplace OWNER TO nautobot;

--
-- Name: nautobot_golden_config_goldenconfig; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.nautobot_golden_config_goldenconfig (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    backup_config text NOT NULL,
    backup_last_attempt_date timestamp with time zone,
    backup_last_success_date timestamp with time zone,
    intended_config text NOT NULL,
    intended_last_attempt_date timestamp with time zone,
    intended_last_success_date timestamp with time zone,
    compliance_config text NOT NULL,
    compliance_last_attempt_date timestamp with time zone,
    compliance_last_success_date timestamp with time zone,
    device_id uuid NOT NULL
);


ALTER TABLE public.nautobot_golden_config_goldenconfig OWNER TO nautobot;

--
-- Name: nautobot_golden_config_goldenconfigsetting; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.nautobot_golden_config_goldenconfigsetting (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    backup_path_template character varying(255) NOT NULL,
    intended_path_template character varying(255) NOT NULL,
    jinja_path_template character varying(255) NOT NULL,
    backup_test_connectivity boolean NOT NULL,
    scope jsonb,
    jinja_repository_id uuid,
    description character varying(200) NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    backup_repository_id uuid,
    intended_repository_id uuid,
    sot_agg_query_id uuid,
    CONSTRAINT nautobot_golden_config_goldenconfigsetting_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.nautobot_golden_config_goldenconfigsetting OWNER TO nautobot;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO nautobot;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO nautobot;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO nautobot;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO nautobot;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO nautobot;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO nautobot;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO nautobot;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO nautobot;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO nautobot;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO nautobot;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO nautobot;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO nautobot;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO nautobot;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO nautobot;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.tenancy_tenant (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id uuid
);


ALTER TABLE public.tenancy_tenant OWNER TO nautobot;

--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.tenancy_tenantgroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id uuid,
    CONSTRAINT tenancy_tenantgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_tenantgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_tenantgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_tenantgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO nautobot;

--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    enabled boolean NOT NULL,
    actions jsonb NOT NULL,
    constraints jsonb
);


ALTER TABLE public.users_objectpermission OWNER TO nautobot;

--
-- Name: users_objectpermission_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission_groups (
    id bigint NOT NULL,
    objectpermission_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_groups OWNER TO nautobot;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.users_objectpermission_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_groups_id_seq OWNER TO nautobot;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.users_objectpermission_groups_id_seq OWNED BY public.users_objectpermission_groups.id;


--
-- Name: users_objectpermission_object_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission_object_types (
    id bigint NOT NULL,
    objectpermission_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_object_types OWNER TO nautobot;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.users_objectpermission_object_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_object_types_id_seq OWNER TO nautobot;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.users_objectpermission_object_types_id_seq OWNED BY public.users_objectpermission_object_types.id;


--
-- Name: users_objectpermission_users; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission_users (
    id bigint NOT NULL,
    objectpermission_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.users_objectpermission_users OWNER TO nautobot;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.users_objectpermission_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_users_id_seq OWNER TO nautobot;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.users_objectpermission_users_id_seq OWNED BY public.users_objectpermission_users.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_token (
    id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(200) NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.users_token OWNER TO nautobot;

--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_cluster (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id uuid,
    site_id uuid,
    tenant_id uuid,
    type_id uuid NOT NULL
);


ALTER TABLE public.virtualization_cluster OWNER TO nautobot;

--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_clustergroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO nautobot;

--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_clustertype (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO nautobot;

--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_virtualmachine (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    local_context_data jsonb,
    local_context_data_owner_object_id uuid,
    name character varying(64) NOT NULL,
    vcpus smallint,
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id uuid NOT NULL,
    local_context_data_owner_content_type_id integer,
    platform_id uuid,
    primary_ip4_id uuid,
    primary_ip6_id uuid,
    role_id uuid,
    status_id uuid,
    tenant_id uuid,
    local_context_schema_id uuid,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0)),
    CONSTRAINT virtualization_virtualmachine_vcpus_check CHECK ((vcpus >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO nautobot;

--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_vminterface (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    enabled boolean NOT NULL,
    mac_address character varying(18),
    mtu integer,
    mode character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    untagged_vlan_id uuid,
    virtual_machine_id uuid NOT NULL,
    CONSTRAINT virtualization_vminterface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.virtualization_vminterface OWNER TO nautobot;

--
-- Name: virtualization_vminterface_tagged_vlans; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_vminterface_tagged_vlans (
    id bigint NOT NULL,
    vminterface_id uuid NOT NULL,
    vlan_id uuid NOT NULL
);


ALTER TABLE public.virtualization_vminterface_tagged_vlans OWNER TO nautobot;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_tagged_vlans_id_seq OWNER TO nautobot;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq OWNED BY public.virtualization_vminterface_tagged_vlans.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: constance_config id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.constance_config ALTER COLUMN id SET DEFAULT nextval('public.constance_config_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_clusters id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_clusters_id_seq'::regclass);


--
-- Name: extras_configcontext_device_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_device_types_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tags id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tags_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_customfield_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_content_types_id_seq'::regclass);


--
-- Name: extras_status_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_status_content_types_id_seq'::regclass);


--
-- Name: extras_tag_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_content_types_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_content_types_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: users_objectpermission_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_groups_id_seq'::regclass);


--
-- Name: users_objectpermission_object_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_object_types_id_seq'::regclass);


--
-- Name: users_objectpermission_users id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_users_id_seq'::regclass);


--
-- Name: virtualization_vminterface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_tagged_vlans_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	13	add_permission
2	Can change permission	13	change_permission
3	Can delete permission	13	delete_permission
4	Can view permission	13	view_permission
5	Can add group	14	add_group
6	Can change group	14	change_group
7	Can delete group	14	delete_group
8	Can view group	14	view_group
11	Can add content type	16	add_contenttype
12	Can change content type	16	change_contenttype
13	Can delete content type	16	delete_contenttype
14	Can view content type	16	view_contenttype
15	Can add session	17	add_session
16	Can change session	17	change_session
17	Can delete session	17	delete_session
18	Can view session	17	view_session
19	Can add association	18	add_association
20	Can change association	18	change_association
21	Can delete association	18	delete_association
22	Can view association	18	view_association
23	Can add code	19	add_code
24	Can change code	19	change_code
25	Can delete code	19	delete_code
26	Can view code	19	view_code
27	Can add nonce	20	add_nonce
28	Can change nonce	20	change_nonce
29	Can delete nonce	20	delete_nonce
30	Can view nonce	20	view_nonce
31	Can add user social auth	21	add_usersocialauth
32	Can change user social auth	21	change_usersocialauth
33	Can delete user social auth	21	delete_usersocialauth
34	Can view user social auth	21	view_usersocialauth
35	Can add partial	22	add_partial
36	Can change partial	22	change_partial
37	Can delete partial	22	delete_partial
38	Can view partial	22	view_partial
39	Can add tag	23	add_tag
40	Can change tag	23	change_tag
41	Can delete tag	23	delete_tag
42	Can view tag	23	view_tag
43	Can add tagged item	24	add_taggeditem
44	Can change tagged item	24	change_taggeditem
45	Can delete tagged item	24	delete_taggeditem
46	Can view tagged item	24	view_taggeditem
47	Can add log entry	25	add_logentry
48	Can change log entry	25	change_logentry
49	Can delete log entry	25	delete_logentry
50	Can view log entry	25	view_logentry
51	Can add crontab	26	add_crontabschedule
52	Can change crontab	26	change_crontabschedule
53	Can delete crontab	26	delete_crontabschedule
54	Can view crontab	26	view_crontabschedule
55	Can add interval	27	add_intervalschedule
56	Can change interval	27	change_intervalschedule
57	Can delete interval	27	delete_intervalschedule
58	Can view interval	27	view_intervalschedule
59	Can add periodic task	28	add_periodictask
60	Can change periodic task	28	change_periodictask
61	Can delete periodic task	28	delete_periodictask
62	Can view periodic task	28	view_periodictask
63	Can add periodic tasks	29	add_periodictasks
64	Can change periodic tasks	29	change_periodictasks
65	Can delete periodic tasks	29	delete_periodictasks
66	Can view periodic tasks	29	view_periodictasks
67	Can add solar event	30	add_solarschedule
68	Can change solar event	30	change_solarschedule
69	Can delete solar event	30	delete_solarschedule
70	Can view solar event	30	view_solarschedule
71	Can add clocked	31	add_clockedschedule
72	Can change clocked	31	change_clockedschedule
73	Can delete clocked	31	delete_clockedschedule
74	Can view clocked	31	view_clockedschedule
75	Can add circuit	6	add_circuit
76	Can change circuit	6	change_circuit
77	Can delete circuit	6	delete_circuit
78	Can view circuit	6	view_circuit
79	Can add circuit termination	32	add_circuittermination
80	Can change circuit termination	32	change_circuittermination
81	Can delete circuit termination	32	delete_circuittermination
82	Can view circuit termination	32	view_circuittermination
83	Can add circuit type	33	add_circuittype
84	Can change circuit type	33	change_circuittype
85	Can delete circuit type	33	delete_circuittype
86	Can view circuit type	33	view_circuittype
87	Can add provider	34	add_provider
88	Can change provider	34	change_provider
89	Can delete provider	34	delete_provider
90	Can view provider	34	view_provider
91	Can add provider network	35	add_providernetwork
92	Can change provider network	35	change_providernetwork
93	Can delete provider network	35	delete_providernetwork
94	Can view provider network	35	view_providernetwork
95	Can add cable	4	add_cable
96	Can change cable	4	change_cable
97	Can delete cable	4	delete_cable
98	Can view cable	4	view_cable
99	Can add cable path	36	add_cablepath
100	Can change cable path	36	change_cablepath
101	Can delete cable path	36	delete_cablepath
102	Can view cable path	36	view_cablepath
103	Can add console port	37	add_consoleport
104	Can change console port	37	change_consoleport
105	Can delete console port	37	delete_consoleport
106	Can view console port	37	view_consoleport
107	Can add console port template	38	add_consoleporttemplate
108	Can change console port template	38	change_consoleporttemplate
109	Can delete console port template	38	delete_consoleporttemplate
110	Can view console port template	38	view_consoleporttemplate
111	Can add console server port	39	add_consoleserverport
112	Can change console server port	39	change_consoleserverport
113	Can delete console server port	39	delete_consoleserverport
114	Can view console server port	39	view_consoleserverport
115	Can add console server port template	40	add_consoleserverporttemplate
116	Can change console server port template	40	change_consoleserverporttemplate
117	Can delete console server port template	40	delete_consoleserverporttemplate
118	Can view console server port template	40	view_consoleserverporttemplate
119	Can add device	1	add_device
120	Can change device	1	change_device
121	Can delete device	1	delete_device
122	Can view device	1	view_device
123	Can add device bay	41	add_devicebay
124	Can change device bay	41	change_devicebay
125	Can delete device bay	41	delete_devicebay
126	Can view device bay	41	view_devicebay
127	Can add device bay template	42	add_devicebaytemplate
128	Can change device bay template	42	change_devicebaytemplate
129	Can delete device bay template	42	delete_devicebaytemplate
130	Can view device bay template	42	view_devicebaytemplate
131	Can add device role	43	add_devicerole
132	Can change device role	43	change_devicerole
133	Can delete device role	43	delete_devicerole
134	Can view device role	43	view_devicerole
135	Can add device type	44	add_devicetype
136	Can change device type	44	change_devicetype
137	Can delete device type	44	delete_devicetype
138	Can view device type	44	view_devicetype
139	Can add front port	45	add_frontport
140	Can change front port	45	change_frontport
141	Can delete front port	45	delete_frontport
142	Can view front port	45	view_frontport
143	Can add front port template	46	add_frontporttemplate
144	Can change front port template	46	change_frontporttemplate
145	Can delete front port template	46	delete_frontporttemplate
146	Can view front port template	46	view_frontporttemplate
147	Can add interface	47	add_interface
148	Can change interface	47	change_interface
149	Can delete interface	47	delete_interface
150	Can view interface	47	view_interface
151	Can add interface template	48	add_interfacetemplate
152	Can change interface template	48	change_interfacetemplate
153	Can delete interface template	48	delete_interfacetemplate
154	Can view interface template	48	view_interfacetemplate
155	Can add inventory item	49	add_inventoryitem
156	Can change inventory item	49	change_inventoryitem
157	Can delete inventory item	49	delete_inventoryitem
158	Can view inventory item	49	view_inventoryitem
159	Can add manufacturer	50	add_manufacturer
160	Can change manufacturer	50	change_manufacturer
161	Can delete manufacturer	50	delete_manufacturer
162	Can view manufacturer	50	view_manufacturer
163	Can add platform	51	add_platform
164	Can change platform	51	change_platform
165	Can delete platform	51	delete_platform
166	Can view platform	51	view_platform
167	Can add power feed	5	add_powerfeed
168	Can change power feed	5	change_powerfeed
169	Can delete power feed	5	delete_powerfeed
170	Can view power feed	5	view_powerfeed
171	Can add power outlet	52	add_poweroutlet
172	Can change power outlet	52	change_poweroutlet
173	Can delete power outlet	52	delete_poweroutlet
174	Can view power outlet	52	view_poweroutlet
175	Can add power outlet template	53	add_poweroutlettemplate
176	Can change power outlet template	53	change_poweroutlettemplate
177	Can delete power outlet template	53	delete_poweroutlettemplate
178	Can view power outlet template	53	view_poweroutlettemplate
179	Can add power panel	54	add_powerpanel
180	Can change power panel	54	change_powerpanel
181	Can delete power panel	54	delete_powerpanel
182	Can view power panel	54	view_powerpanel
183	Can add power port	55	add_powerport
184	Can change power port	55	change_powerport
185	Can delete power port	55	delete_powerport
186	Can view power port	55	view_powerport
187	Can add power port template	56	add_powerporttemplate
188	Can change power port template	56	change_powerporttemplate
189	Can delete power port template	56	delete_powerporttemplate
190	Can view power port template	56	view_powerporttemplate
191	Can add rack	3	add_rack
192	Can change rack	3	change_rack
193	Can delete rack	3	delete_rack
194	Can view rack	3	view_rack
195	Can add rack group	57	add_rackgroup
196	Can change rack group	57	change_rackgroup
197	Can delete rack group	57	delete_rackgroup
198	Can view rack group	57	view_rackgroup
199	Can add rack reservation	58	add_rackreservation
200	Can change rack reservation	58	change_rackreservation
201	Can delete rack reservation	58	delete_rackreservation
202	Can view rack reservation	58	view_rackreservation
203	Can add rack role	59	add_rackrole
204	Can change rack role	59	change_rackrole
205	Can delete rack role	59	delete_rackrole
206	Can view rack role	59	view_rackrole
207	Can add rear port	60	add_rearport
208	Can change rear port	60	change_rearport
209	Can delete rear port	60	delete_rearport
210	Can view rear port	60	view_rearport
211	Can add rear port template	61	add_rearporttemplate
212	Can change rear port template	61	change_rearporttemplate
213	Can delete rear port template	61	delete_rearporttemplate
214	Can view rear port template	61	view_rearporttemplate
215	Can add region	62	add_region
216	Can change region	62	change_region
217	Can delete region	62	delete_region
218	Can view region	62	view_region
219	Can add site	2	add_site
220	Can change site	2	change_site
221	Can delete site	2	delete_site
222	Can view site	2	view_site
223	Can add virtual chassis	63	add_virtualchassis
224	Can change virtual chassis	63	change_virtualchassis
225	Can delete virtual chassis	63	delete_virtualchassis
226	Can view virtual chassis	63	view_virtualchassis
227	Can add aggregate	64	add_aggregate
228	Can change aggregate	64	change_aggregate
229	Can delete aggregate	64	delete_aggregate
230	Can view aggregate	64	view_aggregate
231	Can add IP address	8	add_ipaddress
232	Can change IP address	8	change_ipaddress
233	Can delete IP address	8	delete_ipaddress
234	Can view IP address	8	view_ipaddress
235	Can add prefix	7	add_prefix
236	Can change prefix	7	change_prefix
237	Can delete prefix	7	delete_prefix
238	Can view prefix	7	view_prefix
239	Can add RIR	65	add_rir
240	Can change RIR	65	change_rir
241	Can delete RIR	65	delete_rir
242	Can view RIR	65	view_rir
243	Can add role	66	add_role
244	Can change role	66	change_role
245	Can delete role	66	delete_role
246	Can view role	66	view_role
247	Can add route target	67	add_routetarget
248	Can change route target	67	change_routetarget
249	Can delete route target	67	delete_routetarget
250	Can view route target	67	view_routetarget
251	Can add VRF	68	add_vrf
252	Can change VRF	68	change_vrf
253	Can delete VRF	68	delete_vrf
254	Can view VRF	68	view_vrf
255	Can add VLAN group	69	add_vlangroup
256	Can change VLAN group	69	change_vlangroup
257	Can delete VLAN group	69	delete_vlangroup
258	Can view VLAN group	69	view_vlangroup
259	Can add VLAN	9	add_vlan
260	Can change VLAN	9	change_vlan
261	Can delete VLAN	9	delete_vlan
262	Can view VLAN	9	view_vlan
263	Can add service	70	add_service
264	Can change service	70	change_service
265	Can delete service	70	delete_service
266	Can view service	70	view_service
267	Can add config context	71	add_configcontext
268	Can change config context	71	change_configcontext
269	Can delete config context	71	delete_configcontext
270	Can view config context	71	view_configcontext
271	Can add custom field	11	add_customfield
272	Can change custom field	11	change_customfield
273	Can delete custom field	11	delete_customfield
274	Can view custom field	11	view_customfield
275	Can add custom field choice	72	add_customfieldchoice
276	Can change custom field choice	72	change_customfieldchoice
277	Can delete custom field choice	72	delete_customfieldchoice
278	Can view custom field choice	72	view_customfieldchoice
279	Can add custom link	73	add_customlink
280	Can change custom link	73	change_customlink
281	Can delete custom link	73	delete_customlink
282	Can view custom link	73	view_customlink
283	Can add export template	74	add_exporttemplate
284	Can change export template	74	change_exporttemplate
285	Can delete export template	74	delete_exporttemplate
286	Can view export template	74	view_exporttemplate
287	Can add Git repository	75	add_gitrepository
288	Can change Git repository	75	change_gitrepository
289	Can delete Git repository	75	delete_gitrepository
290	Can view Git repository	75	view_gitrepository
291	Can add image attachment	76	add_imageattachment
292	Can change image attachment	76	change_imageattachment
293	Can delete image attachment	76	delete_imageattachment
294	Can view image attachment	76	view_imageattachment
295	Can add job result	77	add_jobresult
296	Can change job result	77	change_jobresult
297	Can delete job result	77	delete_jobresult
298	Can view job result	77	view_jobresult
299	Can add relationship	78	add_relationship
300	Can change relationship	78	change_relationship
301	Can delete relationship	78	delete_relationship
302	Can view relationship	78	view_relationship
303	Can add tag	79	add_tag
304	Can change tag	79	change_tag
305	Can delete tag	79	delete_tag
306	Can view tag	79	view_tag
307	Can add webhook	80	add_webhook
308	Can change webhook	80	change_webhook
309	Can delete webhook	80	delete_webhook
310	Can view webhook	80	view_webhook
311	Can add tagged item	81	add_taggeditem
312	Can change tagged item	81	change_taggeditem
313	Can delete tagged item	81	delete_taggeditem
314	Can view tagged item	81	view_taggeditem
315	Can add status	82	add_status
316	Can change status	82	change_status
317	Can delete status	82	delete_status
318	Can view status	82	view_status
319	Can add relationship association	83	add_relationshipassociation
320	Can change relationship association	83	change_relationshipassociation
321	Can delete relationship association	83	delete_relationshipassociation
322	Can view relationship association	83	view_relationshipassociation
323	Can add object change	84	add_objectchange
324	Can change object change	84	change_objectchange
325	Can delete object change	84	delete_objectchange
326	Can view object change	84	view_objectchange
327	Can add GraphQL query	85	add_graphqlquery
328	Can change GraphQL query	85	change_graphqlquery
329	Can delete GraphQL query	85	delete_graphqlquery
330	Can view GraphQL query	85	view_graphqlquery
331	Can add config context schema	86	add_configcontextschema
332	Can change config context schema	86	change_configcontextschema
333	Can delete config context schema	86	delete_configcontextschema
334	Can view config context schema	86	view_configcontextschema
335	Can add computed field	87	add_computedfield
336	Can change computed field	87	change_computedfield
337	Can delete computed field	87	delete_computedfield
338	Can view computed field	87	view_computedfield
339	Can add file attachment	88	add_fileattachment
340	Can change file attachment	88	change_fileattachment
341	Can delete file attachment	88	delete_fileattachment
342	Can view file attachment	88	view_fileattachment
343	Can add file proxy	89	add_fileproxy
344	Can change file proxy	89	change_fileproxy
345	Can delete file proxy	89	delete_fileproxy
346	Can view file proxy	89	view_fileproxy
347	Can add health check test model	90	add_healthchecktestmodel
348	Can change health check test model	90	change_healthchecktestmodel
349	Can delete health check test model	90	delete_healthchecktestmodel
350	Can view health check test model	90	view_healthchecktestmodel
351	Can add scheduled jobs	91	add_scheduledjobs
352	Can change scheduled jobs	91	change_scheduledjobs
353	Can delete scheduled jobs	91	delete_scheduledjobs
354	Can view scheduled jobs	91	view_scheduledjobs
355	Can add scheduled job	92	add_scheduledjob
356	Can change scheduled job	92	change_scheduledjob
357	Can delete scheduled job	92	delete_scheduledjob
358	Can view scheduled job	92	view_scheduledjob
359	Can add secret	93	add_secret
360	Can change secret	93	change_secret
361	Can delete secret	93	delete_secret
362	Can view secret	93	view_secret
363	Can add secrets group	94	add_secretsgroup
364	Can change secrets group	94	change_secretsgroup
365	Can delete secrets group	94	delete_secretsgroup
366	Can view secrets group	94	view_secretsgroup
367	Can add secrets group association	95	add_secretsgroupassociation
368	Can change secrets group association	95	change_secretsgroupassociation
369	Can delete secrets group association	95	delete_secretsgroupassociation
370	Can view secrets group association	95	view_secretsgroupassociation
371	Can add job log entry	96	add_joblogentry
372	Can change job log entry	96	change_joblogentry
373	Can delete job log entry	96	delete_joblogentry
374	Can view job log entry	96	view_joblogentry
375	Can add job	12	add_job
376	Can change job	12	change_job
377	Can delete job	12	delete_job
378	Can view job	12	view_job
379	Can add dynamic group	97	add_dynamicgroup
380	Can change dynamic group	97	change_dynamicgroup
381	Can delete dynamic group	97	delete_dynamicgroup
382	Can view dynamic group	97	view_dynamicgroup
383	Can add tenant group	98	add_tenantgroup
384	Can change tenant group	98	change_tenantgroup
385	Can delete tenant group	98	delete_tenantgroup
386	Can view tenant group	98	view_tenantgroup
387	Can add tenant	99	add_tenant
388	Can change tenant	99	change_tenant
389	Can delete tenant	99	delete_tenant
390	Can view tenant	99	view_tenant
391	Can add user	100	add_user
392	Can change user	100	change_user
393	Can delete user	100	delete_user
394	Can view user	100	view_user
395	Can add Group	101	add_admingroup
396	Can change Group	101	change_admingroup
397	Can delete Group	101	delete_admingroup
398	Can view Group	101	view_admingroup
399	Can add token	102	add_token
400	Can change token	102	change_token
401	Can delete token	102	delete_token
402	Can view token	102	view_token
403	Can add permission	103	add_objectpermission
404	Can change permission	103	change_objectpermission
405	Can delete permission	103	delete_objectpermission
406	Can view permission	103	view_objectpermission
407	Can add cluster	104	add_cluster
408	Can change cluster	104	change_cluster
409	Can delete cluster	104	delete_cluster
410	Can view cluster	104	view_cluster
411	Can add cluster group	105	add_clustergroup
412	Can change cluster group	105	change_clustergroup
413	Can delete cluster group	105	delete_clustergroup
414	Can view cluster group	105	view_clustergroup
415	Can add cluster type	106	add_clustertype
416	Can change cluster type	106	change_clustertype
417	Can delete cluster type	106	delete_clustertype
418	Can view cluster type	106	view_clustertype
419	Can add virtual machine	10	add_virtualmachine
420	Can change virtual machine	10	change_virtualmachine
421	Can delete virtual machine	10	delete_virtualmachine
422	Can view virtual machine	10	view_virtualmachine
423	Can add VM interface	107	add_vminterface
424	Can change VM interface	107	change_vminterface
425	Can delete VM interface	107	delete_vminterface
426	Can view VM interface	107	view_vminterface
427	Access admin page	108	view
428	Can add constance	109	add_constance
429	Can change constance	109	change_constance
430	Can delete constance	109	delete_constance
431	Can view constance	109	view_constance
432	Can add compliance feature	110	add_compliancefeature
433	Can change compliance feature	110	change_compliancefeature
434	Can delete compliance feature	110	delete_compliancefeature
435	Can view compliance feature	110	view_compliancefeature
436	Can add compliance rule	111	add_compliancerule
437	Can change compliance rule	111	change_compliancerule
438	Can delete compliance rule	111	delete_compliancerule
439	Can view compliance rule	111	view_compliancerule
440	Can add Golden Config Setting	112	add_goldenconfigsetting
441	Can change Golden Config Setting	112	change_goldenconfigsetting
442	Can delete Golden Config Setting	112	delete_goldenconfigsetting
443	Can view Golden Config Setting	112	view_goldenconfigsetting
444	Can add golden config	113	add_goldenconfig
445	Can change golden config	113	change_goldenconfig
446	Can delete golden config	113	delete_goldenconfig
447	Can view golden config	113	view_goldenconfig
448	Can add config replace	114	add_configreplace
449	Can change config replace	114	change_configreplace
450	Can delete config replace	114	delete_configreplace
451	Can view config replace	114	view_configreplace
452	Can add config remove	115	add_configremove
453	Can change config remove	115	change_configremove
454	Can delete config remove	115	delete_configremove
455	Can view config remove	115	view_configremove
456	Can add config compliance	116	add_configcompliance
457	Can change config compliance	116	change_configcompliance
458	Can delete config compliance	116	delete_configcompliance
459	Can view config compliance	116	view_configcompliance
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_user (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, id, config_data) FROM stdin;
pbkdf2_sha256$260000$SStnUMqvQ6L37RgQZkrKQo$pvASO/xWqGz5upbj931SpE4JD1aXiMuNosyTddC9AC4=	2022-06-29 09:18:46.526695+00	t	admin			admin@example.com	t	t	2022-06-14 09:08:18.26844+00	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_circuit (id, created, last_updated, _custom_field_data, cid, install_date, commit_rate, description, comments, provider_id, status_id, tenant_id, type_id, termination_a_id, termination_z_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_circuittermination (id, _cable_peer_id, term_side, port_speed, upstream_speed, xconnect_id, pp_info, description, _cable_peer_type_id, _path_id, cable_id, circuit_id, site_id, provider_network_id, _custom_field_data, created, last_updated) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_circuittype (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_provider (id, created, last_updated, _custom_field_data, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
\.


--
-- Data for Name: circuits_providernetwork; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_providernetwork (id, created, last_updated, _custom_field_data, name, slug, description, comments, provider_id) FROM stdin;
\.


--
-- Data for Name: constance_config; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.constance_config (id, key, value) FROM stdin;
1	constance:nautobot:PER_PAGE_DEFAULTS	gAJdcQAoSxlLMktkS/pN9AFN6ANlLg==
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_cable (id, created, last_updated, _custom_field_data, termination_a_id, termination_b_id, type, label, color, length, length_unit, _abs_length, _termination_a_device_id, _termination_b_device_id, status_id, termination_a_type_id, termination_b_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_cablepath; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_cablepath (id, origin_id, destination_id, path, is_active, is_split, destination_type_id, origin_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_consoleport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_consoleporttemplate (id, _custom_field_data, name, _name, label, description, type, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_consoleserverport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_consoleserverporttemplate (id, _custom_field_data, name, _name, label, description, type, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_device (id, created, last_updated, _custom_field_data, local_context_data, local_context_data_owner_object_id, name, _name, serial, asset_tag, "position", face, vc_position, vc_priority, comments, cluster_id, device_role_id, device_type_id, local_context_data_owner_content_type_id, platform_id, primary_ip4_id, primary_ip6_id, rack_id, site_id, status_id, tenant_id, virtual_chassis_id, local_context_schema_id, secrets_group_id) FROM stdin;
774633c5-8876-47c1-b9a7-0af0777d42c5	2022-06-14	2022-06-29 09:27:22.231947+00	{}	\N	\N	clab-basic-R1	clab-basic-R00000001		\N	\N		\N	\N		\N	5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd	941361f1-bd19-47f8-901a-fba1db0a477e	\N	50e0618d-c01a-464d-bb31-002e3c39d0ed	\N	\N	\N	0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd	588f4497-9c19-412f-8a41-d8c877e8b863	982fa2a9-48aa-4cfa-b911-64acbe5b446c	\N	\N	\N
06745599-bc34-41c5-af97-699accfc8ad6	2022-06-14	2022-06-29 09:27:36.028615+00	{}	\N	\N	clab-basic-R2	clab-basic-R00000002		\N	\N		\N	\N		\N	5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd	941361f1-bd19-47f8-901a-fba1db0a477e	\N	50e0618d-c01a-464d-bb31-002e3c39d0ed	\N	\N	\N	0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd	588f4497-9c19-412f-8a41-d8c877e8b863	982fa2a9-48aa-4cfa-b911-64acbe5b446c	\N	\N	\N
81779b36-7a77-4055-b8e9-6eb98e50bff5	2022-06-14	2022-06-29 09:27:50.768163+00	{}	\N	\N	clab-basic-R3	clab-basic-R00000003		\N	\N		\N	\N		\N	5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd	941361f1-bd19-47f8-901a-fba1db0a477e	\N	50e0618d-c01a-464d-bb31-002e3c39d0ed	\N	\N	\N	0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd	588f4497-9c19-412f-8a41-d8c877e8b863	32c17dc0-cb64-40b7-a09f-e40f91e2c1de	\N	\N	\N
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicebay (id, _custom_field_data, name, _name, label, description, device_id, installed_device_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicebaytemplate (id, _custom_field_data, name, _name, label, description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicerole (id, created, last_updated, _custom_field_data, name, slug, color, vm_role, description) FROM stdin;
5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd	2022-06-29	2022-06-29 09:19:45.22797+00	{}	router	router	795548	f
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicetype (id, created, last_updated, _custom_field_data, model, slug, part_number, u_height, is_full_depth, subdevice_role, front_image, rear_image, comments, manufacturer_id) FROM stdin;
941361f1-bd19-47f8-901a-fba1db0a477e	2022-06-29	2022-06-29 09:20:08.932212+00	{}	cEOS	ceos		1	t	cf8f188f-27fd-4294-9afd-5c13bbaa2c90
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_frontport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, rear_port_position, _cable_peer_type_id, cable_id, device_id, rear_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_frontporttemplate (id, _custom_field_data, name, _name, label, description, type, rear_port_position, device_type_id, rear_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interface (id, _custom_field_data, name, label, description, _cable_peer_id, enabled, mac_address, mtu, mode, _name, type, mgmt_only, _cable_peer_type_id, _path_id, cable_id, device_id, lag_id, untagged_vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interfacetemplate (id, _custom_field_data, name, label, description, _name, type, mgmt_only, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_inventoryitem (id, _custom_field_data, name, _name, label, description, part_id, serial, asset_tag, discovered, lft, rght, tree_id, level, device_id, manufacturer_id, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_manufacturer (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
cf8f188f-27fd-4294-9afd-5c13bbaa2c90	2022-06-29	2022-06-29 09:19:01.676417+00	{}	Arista	arista
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_platform (id, created, last_updated, _custom_field_data, name, slug, napalm_driver, napalm_args, description, manufacturer_id) FROM stdin;
50e0618d-c01a-464d-bb31-002e3c39d0ed	2022-06-29	2022-06-29 09:19:29.788744+00	{}	Arista EOS	arista_eos		\N		cf8f188f-27fd-4294-9afd-5c13bbaa2c90
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerfeed (id, created, last_updated, _custom_field_data, _cable_peer_id, name, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, _cable_peer_type_id, _path_id, cable_id, power_panel_id, rack_id, status_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_poweroutlet (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, feed_leg, _cable_peer_type_id, _path_id, cable_id, device_id, power_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_poweroutlettemplate (id, _custom_field_data, name, _name, label, description, type, feed_leg, device_type_id, power_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerpanel (id, created, last_updated, _custom_field_data, name, rack_group_id, site_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, maximum_draw, allocated_draw, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerporttemplate (id, _custom_field_data, name, _name, label, description, type, maximum_draw, allocated_draw, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rack (id, created, last_updated, _custom_field_data, name, _name, facility_id, serial, asset_tag, type, width, u_height, desc_units, outer_width, outer_depth, outer_unit, comments, group_id, role_id, site_id, status_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rackgroup (id, created, last_updated, _custom_field_data, name, slug, description, lft, rght, tree_id, level, parent_id, site_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rackreservation (id, created, last_updated, _custom_field_data, units, description, rack_id, tenant_id, user_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rackrole (id, created, last_updated, _custom_field_data, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rearport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, positions, _cable_peer_type_id, cable_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rearporttemplate (id, _custom_field_data, name, _name, label, description, type, positions, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_region (id, created, last_updated, _custom_field_data, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_site (id, created, last_updated, _custom_field_data, name, _name, slug, facility, asn, time_zone, description, physical_address, shipping_address, latitude, longitude, contact_name, contact_phone, contact_email, comments, region_id, status_id, tenant_id) FROM stdin;
0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd	2022-06-29	2022-06-29 09:21:07.522368+00	{}	Dublin	Dublin	dublin		\N	\N	\N					\N	588f4497-9c19-412f-8a41-d8c877e8b863	\N
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_virtualchassis (id, created, last_updated, _custom_field_data, name, domain, master_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	dcim	device
2	dcim	site
3	dcim	rack
4	dcim	cable
5	dcim	powerfeed
6	circuits	circuit
7	ipam	prefix
8	ipam	ipaddress
9	ipam	vlan
10	virtualization	virtualmachine
11	extras	customfield
12	extras	job
13	auth	permission
14	auth	group
16	contenttypes	contenttype
17	sessions	session
18	social_django	association
19	social_django	code
20	social_django	nonce
21	social_django	usersocialauth
22	social_django	partial
23	taggit	tag
24	taggit	taggeditem
25	admin	logentry
26	django_celery_beat	crontabschedule
27	django_celery_beat	intervalschedule
28	django_celery_beat	periodictask
29	django_celery_beat	periodictasks
30	django_celery_beat	solarschedule
31	django_celery_beat	clockedschedule
32	circuits	circuittermination
33	circuits	circuittype
34	circuits	provider
35	circuits	providernetwork
36	dcim	cablepath
37	dcim	consoleport
38	dcim	consoleporttemplate
39	dcim	consoleserverport
40	dcim	consoleserverporttemplate
41	dcim	devicebay
42	dcim	devicebaytemplate
43	dcim	devicerole
44	dcim	devicetype
45	dcim	frontport
46	dcim	frontporttemplate
47	dcim	interface
48	dcim	interfacetemplate
49	dcim	inventoryitem
50	dcim	manufacturer
51	dcim	platform
52	dcim	poweroutlet
53	dcim	poweroutlettemplate
54	dcim	powerpanel
55	dcim	powerport
56	dcim	powerporttemplate
57	dcim	rackgroup
58	dcim	rackreservation
59	dcim	rackrole
60	dcim	rearport
61	dcim	rearporttemplate
62	dcim	region
63	dcim	virtualchassis
64	ipam	aggregate
65	ipam	rir
66	ipam	role
67	ipam	routetarget
68	ipam	vrf
69	ipam	vlangroup
70	ipam	service
71	extras	configcontext
72	extras	customfieldchoice
73	extras	customlink
74	extras	exporttemplate
75	extras	gitrepository
76	extras	imageattachment
77	extras	jobresult
78	extras	relationship
79	extras	tag
80	extras	webhook
81	extras	taggeditem
82	extras	status
83	extras	relationshipassociation
84	extras	objectchange
85	extras	graphqlquery
86	extras	configcontextschema
87	extras	computedfield
88	extras	fileattachment
89	extras	fileproxy
90	extras	healthchecktestmodel
91	extras	scheduledjobs
92	extras	scheduledjob
93	extras	secret
94	extras	secretsgroup
95	extras	secretsgroupassociation
96	extras	joblogentry
97	extras	dynamicgroup
98	tenancy	tenantgroup
99	tenancy	tenant
100	users	user
101	users	admingroup
102	users	token
103	users	objectpermission
104	virtualization	cluster
105	virtualization	clustergroup
106	virtualization	clustertype
107	virtualization	vminterface
108	django_rq	queue
109	database	constance
110	nautobot_golden_config	compliancefeature
111	nautobot_golden_config	compliancerule
112	nautobot_golden_config	goldenconfigsetting
113	nautobot_golden_config	goldenconfig
114	nautobot_golden_config	configreplace
115	nautobot_golden_config	configremove
116	nautobot_golden_config	configcompliance
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-06-14 09:07:17.771598+00
2	contenttypes	0002_remove_content_type_name	2022-06-14 09:07:17.786933+00
3	auth	0001_initial	2022-06-14 09:07:17.865113+00
4	auth	0002_alter_permission_name_max_length	2022-06-14 09:07:17.874395+00
5	auth	0003_alter_user_email_max_length	2022-06-14 09:07:17.883616+00
6	auth	0004_alter_user_username_opts	2022-06-14 09:07:17.894048+00
7	auth	0005_alter_user_last_login_null	2022-06-14 09:07:17.903982+00
8	auth	0006_require_contenttypes_0002	2022-06-14 09:07:17.909526+00
9	auth	0007_alter_validators_add_error_messages	2022-06-14 09:07:17.919836+00
10	auth	0008_alter_user_username_max_length	2022-06-14 09:07:17.931109+00
11	auth	0009_alter_user_last_name_max_length	2022-06-14 09:07:17.94156+00
12	auth	0010_alter_group_name_max_length	2022-06-14 09:07:17.95358+00
13	auth	0011_update_proxy_permissions	2022-06-14 09:07:17.961786+00
14	auth	0012_alter_user_first_name_max_length	2022-06-14 09:07:17.97073+00
15	users	0001_initial	2022-06-14 09:07:18.133245+00
16	admin	0001_initial	2022-06-14 09:07:18.170099+00
17	admin	0002_logentry_remove_auto_add	2022-06-14 09:07:18.184152+00
18	admin	0003_logentry_add_action_flag_choices	2022-06-14 09:07:18.198931+00
19	extras	0001_initial_part_1	2022-06-14 09:07:18.808064+00
20	tenancy	0001_initial	2022-06-14 09:07:18.910753+00
21	dcim	0001_initial_part_1	2022-06-14 09:07:19.466585+00
22	dcim	0002_initial_part_2	2022-06-14 09:07:20.064498+00
23	ipam	0001_initial_part_1	2022-06-14 09:07:20.551437+00
24	extras	0002_initial_part_2	2022-06-14 09:07:21.049468+00
25	dcim	0003_initial_part_3	2022-06-14 09:07:25.25863+00
26	virtualization	0001_initial	2022-06-14 09:07:26.122955+00
27	dcim	0004_initial_part_4	2022-06-14 09:07:31.099667+00
28	extras	0003_initial_part_3	2022-06-14 09:07:32.880996+00
29	extras	0004_populate_default_status_records	2022-06-14 09:07:33.331962+00
30	extras	0005_configcontext_device_types	2022-06-14 09:07:33.502869+00
31	extras	0006_graphqlquery	2022-06-14 09:07:33.532504+00
32	extras	0007_configcontextschema	2022-06-14 09:07:33.98638+00
33	extras	0008_jobresult__custom_field_data	2022-06-14 09:07:34.036593+00
34	extras	0009_computedfield	2022-06-14 09:07:34.152937+00
35	extras	0010_change_cf_validation_max_min_field_to_bigint	2022-06-14 09:07:34.292647+00
36	extras	0011_fileattachment_fileproxy	2022-06-14 09:07:34.357923+00
37	extras	0012_healthchecktestmodel	2022-06-14 09:07:34.371302+00
38	extras	0013_default_fallback_value_computedfield	2022-06-14 09:07:34.417105+00
39	extras	0014_auto_slug	2022-06-14 09:07:34.71534+00
40	extras	0015_scheduled_job	2022-06-14 09:07:35.109828+00
41	extras	0016_secret	2022-06-14 09:07:35.591203+00
42	extras	0017_joblogentry	2022-06-14 09:07:35.717199+00
43	extras	0018_joblog_data_migration	2022-06-14 09:07:36.047013+00
44	extras	0019_joblogentry__meta_options__related_name	2022-06-14 09:07:36.159958+00
45	extras	0020_customfield_changelog	2022-06-14 09:07:36.293433+00
46	extras	0021_customfield_changelog_data	2022-06-14 09:07:36.410656+00
47	dcim	0005_device_local_context_schema	2022-06-14 09:07:36.518095+00
48	dcim	0006_auto_slug	2022-06-14 09:07:37.186288+00
49	dcim	0007_device_secrets_group	2022-06-14 09:07:37.292624+00
50	dcim	0008_increase_all_serial_lengths	2022-06-14 09:07:37.49901+00
51	circuits	0001_initial_part_1	2022-06-14 09:07:37.569642+00
52	circuits	0002_initial_part_2	2022-06-14 09:07:39.294486+00
53	circuits	0003_auto_slug	2022-06-14 09:07:39.361327+00
54	circuits	0004_increase_provider_account_length	2022-06-14 09:07:39.426914+00
55	circuits	0005_providernetwork	2022-06-14 09:07:40.271838+00
56	circuits	0006_cache_circuit_terminations	2022-06-14 09:07:40.610028+00
57	circuits	0007_circuitterminations_primary_model	2022-06-14 09:07:40.903948+00
58	circuits	0008_add_natural_indexing	2022-06-14 09:07:40.971914+00
59	database	0001_initial	2022-06-14 09:07:40.9948+00
60	database	0002_auto_20190129_2304	2022-06-14 09:07:41.004872+00
61	dcim	0009_add_natural_indexing	2022-06-14 09:07:44.054809+00
62	django_celery_beat	0001_initial	2022-06-14 09:07:44.120231+00
63	django_celery_beat	0002_auto_20161118_0346	2022-06-14 09:07:44.147029+00
64	django_celery_beat	0003_auto_20161209_0049	2022-06-14 09:07:44.166021+00
65	django_celery_beat	0004_auto_20170221_0000	2022-06-14 09:07:44.177884+00
66	django_celery_beat	0005_add_solarschedule_events_choices	2022-06-14 09:07:44.191329+00
67	django_celery_beat	0006_auto_20180322_0932	2022-06-14 09:07:44.246258+00
68	django_celery_beat	0007_auto_20180521_0826	2022-06-14 09:07:44.271988+00
69	django_celery_beat	0008_auto_20180914_1922	2022-06-14 09:07:44.321729+00
70	django_celery_beat	0006_auto_20180210_1226	2022-06-14 09:07:44.35404+00
71	django_celery_beat	0006_periodictask_priority	2022-06-14 09:07:44.370513+00
72	django_celery_beat	0009_periodictask_headers	2022-06-14 09:07:44.385836+00
73	django_celery_beat	0010_auto_20190429_0326	2022-06-14 09:07:44.651949+00
74	django_celery_beat	0011_auto_20190508_0153	2022-06-14 09:07:44.687518+00
75	django_celery_beat	0012_periodictask_expire_seconds	2022-06-14 09:07:44.703051+00
76	django_celery_beat	0013_auto_20200609_0727	2022-06-14 09:07:44.717159+00
77	django_celery_beat	0014_remove_clockedschedule_enabled	2022-06-14 09:07:44.731281+00
78	django_celery_beat	0015_edit_solarschedule_events_choices	2022-06-14 09:07:44.744063+00
79	django_rq	0001_initial	2022-06-14 09:07:44.751418+00
80	extras	0022_objectchange_object_datav2	2022-06-14 09:07:44.809534+00
81	extras	0023_job_model	2022-06-14 09:07:45.618335+00
82	extras	0024_job_data_migration	2022-06-14 09:07:45.734411+00
83	extras	0025_add_advanced_ui_boolean_to_customfield_conputedfield_and_relationship	2022-06-14 09:07:45.899782+00
84	extras	0026_job_add_gitrepository_fk	2022-06-14 09:07:46.37624+00
85	extras	0027_job_gitrepository_data_migration	2022-06-14 09:07:46.486145+00
86	extras	0028_job_reduce_source	2022-06-14 09:07:46.606496+00
87	extras	0029_dynamicgroup	2022-06-14 09:07:46.744779+00
88	extras	0030_webhook_alter_unique_together	2022-06-14 09:07:46.803989+00
89	extras	0031_tag_content_types	2022-06-14 09:07:46.931281+00
90	extras	0032_tag_content_types_data_migration	2022-06-14 09:07:47.319307+00
91	extras	0033_add__optimized_indexing	2022-06-14 09:07:48.712061+00
92	ipam	0002_initial_part_2	2022-06-14 09:07:51.453517+00
93	ipam	0003_remove_max_length	2022-06-14 09:07:52.10333+00
94	ipam	0004_fixup_p2p_broadcast	2022-06-14 09:07:52.228266+00
95	ipam	0005_auto_slug	2022-06-14 09:07:52.281424+00
96	ipam	0006_ipaddress_nat_outside_list	2022-06-14 09:07:52.418491+00
97	ipam	0007_add_natural_indexing	2022-06-14 09:07:53.278238+00
98	nautobot_golden_config	0001_initial	2022-06-14 09:07:54.565269+00
99	nautobot_golden_config	0002_custom_data	2022-06-14 09:07:54.688152+00
100	nautobot_golden_config	0003_auto_20210510_2356	2022-06-14 09:07:55.007347+00
101	nautobot_golden_config	0004_auto_20210616_2234	2022-06-14 09:07:55.530108+00
102	nautobot_golden_config	0005_json_compliance_rule	2022-06-14 09:07:56.250296+00
103	nautobot_golden_config	0006_multi_repo_support_temp_field	2022-06-14 09:07:56.640082+00
104	nautobot_golden_config	0007_multi_repo_support_convert_many	2022-06-14 09:07:57.605195+00
105	nautobot_golden_config	0008_multi_repo_support_final	2022-06-14 09:07:58.139049+00
106	nautobot_golden_config	0009_multiple_gc_settings_part_1	2022-06-14 09:07:59.121838+00
107	nautobot_golden_config	0010_multiple_gc_settings_part_2	2022-06-14 09:07:59.264217+00
108	nautobot_golden_config	0011_multiple_gc_settings_part_3	2022-06-14 09:07:59.958042+00
109	nautobot_golden_config	0012_multiple_gc_settings_part_4	2022-06-14 09:08:00.068865+00
110	nautobot_golden_config	0013_multiple_gc_settings_part_5	2022-06-14 09:08:00.491352+00
111	nautobot_golden_config	0014_convert_sotagg_queries_part1	2022-06-14 09:08:00.56227+00
112	nautobot_golden_config	0015_convert_sotagg_queries_part2	2022-06-14 09:08:00.677965+00
113	nautobot_golden_config	0016_convert_sotagg_queries_part3	2022-06-14 09:08:00.862498+00
114	nautobot_golden_config	0017_convert_sotagg_queries_part4	2022-06-14 09:08:00.984243+00
115	nautobot_golden_config	0018_convert_sotagg_queries_part5	2022-06-14 09:08:01.058829+00
116	sessions	0001_initial	2022-06-14 09:08:01.082118+00
117	default	0001_initial	2022-06-14 09:08:01.513855+00
118	social_auth	0001_initial	2022-06-14 09:08:01.516941+00
119	default	0002_add_related_name	2022-06-14 09:08:01.627057+00
120	social_auth	0002_add_related_name	2022-06-14 09:08:01.630075+00
121	default	0003_alter_email_max_length	2022-06-14 09:08:01.645524+00
122	social_auth	0003_alter_email_max_length	2022-06-14 09:08:01.649176+00
123	default	0004_auto_20160423_0400	2022-06-14 09:08:01.673492+00
124	social_auth	0004_auto_20160423_0400	2022-06-14 09:08:01.676658+00
125	social_auth	0005_auto_20160727_2333	2022-06-14 09:08:01.693478+00
126	social_django	0006_partial	2022-06-14 09:08:01.719978+00
127	social_django	0007_code_timestamp	2022-06-14 09:08:01.738661+00
128	social_django	0008_partial_timestamp	2022-06-14 09:08:01.755067+00
129	social_django	0009_auto_20191118_0520	2022-06-14 09:08:01.803534+00
130	social_django	0010_uid_db_index	2022-06-14 09:08:01.835511+00
131	taggit	0001_initial	2022-06-14 09:08:01.989431+00
132	taggit	0002_auto_20150616_2121	2022-06-14 09:08:02.048651+00
133	taggit	0003_taggeditem_add_unique_index	2022-06-14 09:08:02.11037+00
134	tenancy	0002_auto_slug	2022-06-14 09:08:02.499177+00
135	users	0002_token_ordering_by_created	2022-06-14 09:08:02.52387+00
136	virtualization	0002_virtualmachine_local_context_schema	2022-06-14 09:08:02.654366+00
137	virtualization	0003_vminterface_verbose_name	2022-06-14 09:08:02.729931+00
138	virtualization	0004_auto_slug	2022-06-14 09:08:02.850784+00
139	virtualization	0005_add_natural_indexing	2022-06-14 09:08:03.312197+00
140	social_django	0001_initial	2022-06-14 09:08:03.319765+00
141	social_django	0002_add_related_name	2022-06-14 09:08:03.323553+00
142	social_django	0003_alter_email_max_length	2022-06-14 09:08:03.326548+00
143	social_django	0004_auto_20160423_0400	2022-06-14 09:08:03.329713+00
144	social_django	0005_auto_20160727_2333	2022-06-14 09:08:03.332915+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
n2lnm07y2qolv8fruh9ujyzfmfojuuop	.eJxVjjsOwjAQRO_iGkex4_hDyQXgBtHueq0EhC0lToW4O45EAe3MvKd5iQn2Ok_7xuu0RHEW4J21SaHsFVhpUojS63GUypNzbLVH24vTL4ZAD84Hm1tYsNSOysrdseBcF4K6lNxd8c5Ub7w-l21rweWL_blm2OYm6g1FYvCkcPRsbbtkQ8Ih0IhGYzIaHDrsk4vOkEqRvFEBUxxgaIUT7w9QZEZo:1o6TqQ:fXC5MBJDGliPOlue8ygk935jCioSK9X_ScKNQeLldd8	2022-07-13 09:18:46.553331+00
\.


--
-- Data for Name: extras_computedfield; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_computedfield (id, created, last_updated, slug, label, description, template, fallback_value, weight, content_type_id, advanced_ui) FROM stdin;
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext (id, created, last_updated, name, owner_object_id, weight, description, is_active, data, owner_content_type_id, schema_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_cluster_groups (id, configcontext_id, clustergroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_clusters; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_clusters (id, configcontext_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_device_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_device_types (id, configcontext_id, devicetype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tags; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_tags (id, configcontext_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontextschema; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontextschema (id, created, last_updated, _custom_field_data, name, description, slug, data_schema, owner_object_id, owner_content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfield (id, type, name, label, description, required, filter_logic, "default", weight, validation_minimum, validation_maximum, validation_regex, created, last_updated, advanced_ui) FROM stdin;
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_customfieldchoice; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfieldchoice (id, value, weight, field_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customlink (id, created, last_updated, name, text, target_url, weight, group_name, button_class, new_window, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_dynamicgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_dynamicgroup (_custom_field_data, id, created, last_updated, name, slug, description, filter, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_exporttemplate (id, created, last_updated, owner_object_id, name, description, template_code, mime_type, file_extension, content_type_id, owner_content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_fileattachment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_fileattachment (id, bytes, filename, mimetype) FROM stdin;
\.


--
-- Data for Name: extras_fileproxy; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_fileproxy (id, name, file, uploaded_at) FROM stdin;
\.


--
-- Data for Name: extras_gitrepository; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_gitrepository (id, created, last_updated, _custom_field_data, name, slug, remote_url, branch, current_head, _token, username, provided_contents, secrets_group_id) FROM stdin;
3f5dabb2-61ef-4977-aaff-08fb7e7520fa	2022-06-14	2022-06-29 09:32:18.857447+00	{}	gc-backup	gc-backup	https://github.com/pke11y/pknet_backup.git	main	cf7acdbcb0ac35806f09e4dc300926f76d341d28	\\x800000000062bc1c22adf05fb15708af3e097554c0d0342578dc0f2b5e90f2460a82860e73abed9f61065af0c45030e79bb94c4299830d6969b9882a0e45e7e75b1504fbe37cef8175		["nautobot_golden_config.backupconfigs"]	97962bc2-11fa-4833-9ec5-d1316357b113
54515f59-dcf1-419a-b0be-76474be05ebe	2022-06-14	2022-06-29 09:32:31.904539+00	{}	gc-intended	gc-intended	https://github.com/pke11y/pknet_intended.git	main	abd550a0ba1e374b57fdce10fcc2268a778d39ce	\\x800000000062bc1c2fde763da713d8d4ec7da8f1435bb4ab58778fa2589f0501277d708e1303a3ff6b103846ea9131ae3602c417939f6f81e1a65ae4f98799b2940a0558da8e4d40af		["nautobot_golden_config.intendedconfigs"]	97962bc2-11fa-4833-9ec5-d1316357b113
\.


--
-- Data for Name: extras_graphqlquery; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_graphqlquery (id, created, last_updated, name, slug, query, variables) FROM stdin;
\.


--
-- Data for Name: extras_healthchecktestmodel; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_healthchecktestmodel (id, title) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_job; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_job (id, created, last_updated, _custom_field_data, source, module_name, job_class_name, slug, "grouping", name, description, installed, enabled, commit_default, hidden, read_only, approval_required, soft_time_limit, time_limit, grouping_override, name_override, description_override, commit_default_override, hidden_override, read_only_override, approval_required_override, soft_time_limit_override, time_limit_override, git_repository_id) FROM stdin;
69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5	2022-06-29	2022-06-29 11:41:03.740562+00	{}	plugins	nautobot_golden_config.jobs	ComplianceJob	plugins-nautobot_golden_config-jobs-compliancejob	Golden Configuration	Perform Configuration Compliance	Run configuration compliance on your network infrastructure.	t	t	t	f	f	f	0	0	f	ff	f	f	f	f	f	f	\N
2c0071d0-ad6e-4aa0-8f4a-956f1e2de900	2022-06-29	2022-06-29 11:41:03.74935+00	{}	plugins	nautobot_golden_config.jobs	AllGoldenConfig	plugins-nautobot_golden_config-jobs-allgoldenconfig	Golden Configuration	Execute All Golden Configuration Jobs - Single Device	Process to run all Golden Configuration jobs configured.	t	t	t	f	f	f	0	0f	f	f	f	f	f	f	f	f	\N
dacab13e-eb51-4cac-a169-03acb5cbd07c	2022-06-29	2022-06-29 11:41:03.759713+00	{}	plugins	nautobot_golden_config.jobs	AllDevicesGoldenConfig	plugins-nautobot_golden_config-jobs-alldevicesgoldenconfig	Golden Configuration	Execute All Golden Configuration Jobs - Multiple Device	Process to run all Golden Configuration jobs configured against multiple devices.	t	t	tf	f	f	0	0	f	f	f	f	f	f	f	f	f	\N
\.


--
-- Data for Name: extras_joblogentry; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_joblogentry (id, log_level, "grouping", message, created, log_object, absolute_url, job_result_id) FROM stdin;
e7c702e0-c860-4b8c-b662-270ace96b71e	default	main	Creating/refreshing local copy of Git repository "gc-backup"...	2022-06-14 15:22:16.2256+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
f2a80adb-5264-4c1c-a8bc-0eef06e16a4f	success	main	Repository successfully refreshed	2022-06-14 15:22:18.467988+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
a1d9947a-8f5c-4bc3-82da-ae95998d149e	info	main	The current Git repository hash is "3955a55a210e16af45ce823979fd4fa5d86ad769"	2022-06-14 15:22:18.48969+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
7e1f53a3-6e3e-4be2-815a-4ba549f7c469	info	main	Refreshing data provided by gc-backup...	2022-06-14 15:22:18.499148+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
aefb7efe-e1c0-4f48-b252-73758b4ba26d	info	main	Refreshing config context schemas...	2022-06-14 15:22:18.518599+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
0f21b789-304b-4d62-8be8-9ff835a6466e	info	main	Refreshing config contexts...	2022-06-14 15:22:18.545474+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
f78a2cf2-0dd6-4f69-8765-c073899a06af	info	main	Refreshing jobs...	2022-06-14 15:22:18.587272+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
15b26965-bbac-4be3-bdbb-5d149c41b845	warning	jobs	No `jobs` subdirectory found in Git repository	2022-06-14 15:22:18.590736+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
84e68169-0e9e-482c-83c2-6bbe39138e9e	info	main	Refreshing export templates...	2022-06-14 15:22:18.613042+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
e85975e9-7f67-4464-82f8-a4bcb42164ee	info	main	Refreshing Golden Config properties...	2022-06-14 15:22:18.638651+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
7390cb15-52d3-4edf-b4d9-9e36feafb469	info	main	Skipping sync for /opt/nautobot/git/gc-backup/golden_config because directory doesn't exist.	2022-06-14 15:22:18.641936+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
64e985c0-2158-4f55-b106-9ba5318a9dce	info	main	Refreshing backup configs...	2022-06-14 15:22:18.657766+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
4afa86d6-5f76-4265-b24e-ec227f606979	success	main	Successfully Pulled git repo	2022-06-14 15:22:18.664543+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
a3cf7375-e925-4f3d-9a50-39086fe09dc6	info	main	Refreshing intended configs...	2022-06-14 15:22:18.681722+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
c34bc8be-381c-46b0-ab81-1fd0646e92c9	success	main	Successfully Pulled git repo	2022-06-14 15:22:18.684881+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
cc2c965d-3fa3-482d-b03c-bdb00433514c	info	main	Data refresh from gc-backup complete!	2022-06-14 15:22:18.698427+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
4caca69b-9786-4a83-8f13-7dfb931dd9c9	info	main	Repository synchronization completed in 0 minutes, 2.69 seconds	2022-06-14 15:22:18.721062+00	\N	\N	9a69dfa8-cb08-47dc-ab01-33a10b0628e4
5c3b6563-ecc9-4407-8941-f05d5ad78256	default	main	Creating/refreshing local copy of Git repository "gc-intended"...	2022-06-14 15:22:56.729305+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
d18d8020-3d12-4a30-b183-1d87ddfc95d0	success	main	Repository successfully refreshed	2022-06-14 15:22:58.558851+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
6b02f5b9-44b5-432f-ae60-b4bac46aba58	info	main	The current Git repository hash is "fbf9b1ae89fa47d8d88ec681b7107c6ea175e219"	2022-06-14 15:22:58.575147+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
f971d74c-a727-4763-b22b-691b82562ad7	info	main	Refreshing data provided by gc-intended...	2022-06-14 15:22:58.579812+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
eb97c002-61bd-4124-aabe-29877ab12a27	info	main	Refreshing config context schemas...	2022-06-14 15:22:58.600434+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
6092545a-d857-41e5-ad3b-131d9ec87169	info	main	Refreshing config contexts...	2022-06-14 15:22:58.628322+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
9da88e56-93f5-4fec-9b5e-2ab162538557	info	main	Refreshing jobs...	2022-06-14 15:22:58.655838+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
aafdf0c8-b3ff-4b76-8578-19d94c84314c	warning	jobs	No `jobs` subdirectory found in Git repository	2022-06-14 15:22:58.65976+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
5349cf94-d27d-4b76-a22d-3a2d870493c4	info	main	Refreshing export templates...	2022-06-14 15:22:58.683767+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
18eee9b9-a12c-431d-9d5e-285529bca20f	info	main	Refreshing Golden Config properties...	2022-06-14 15:22:58.703293+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
9942cc62-dd55-4a7f-a549-589dbdedebe8	info	main	Skipping sync for /opt/nautobot/git/gc-intended/golden_config because directory doesn't exist.	2022-06-14 15:22:58.708412+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
e1e267e2-ff7a-45db-861f-51b57f6adf1f	info	main	Refreshing backup configs...	2022-06-14 15:22:58.723597+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
0223abb4-a78f-46ad-b4a9-1a8af0841754	success	main	Successfully Pulled git repo	2022-06-14 15:22:58.728666+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
71a82727-ce47-464f-9cf0-6ac1da06ea81	info	main	Refreshing intended configs...	2022-06-14 15:22:58.743441+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
e12b42aa-ecc9-431f-b13e-2b52c986e3d8	success	main	Successfully Pulled git repo	2022-06-14 15:22:58.74647+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
ce69b0e5-ac90-48e9-ad5e-22a658e0db34	info	main	Data refresh from gc-intended complete!	2022-06-14 15:22:58.761413+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
efaa0a28-dd3a-4e3d-bf03-0cdac1b1b1c8	info	main	Repository synchronization completed in 0 minutes, 2.13 seconds	2022-06-14 15:22:58.788233+00	\N	\N	7c097e06-3ecc-4851-9764-db4d2cd147b1
e5729377-f3ce-416d-9393-c9a29564fff9	failure	main	Cmd('git') failed due to: exit code(128)\n  cmdline: git fetch -v origin\n  stderr: 'fatal: unable to access 'https://github.com/pke11y/pknet_intended.git/': GnuTLS recv error (-54): Error in the pull function.'	2022-06-14 15:40:56.773789+00	\N	\N	df28ca8b-3e2c-4505-ba1a-402519363ed8
0478c834-327a-457c-b54a-3a9e6a1c06e0	failure	run	An exception occurred: `GitCommandError: Cmd('git') failed due to: exit code(128)\n  cmdline: git fetch -v origin\n  stderr: 'fatal: unable to access 'https://github.com/pke11y/pknet_intended.git/': GnuTLS recv error (-54): Error in the pull function.'`\n```\nTraceback (most recent call last):\n  File "/usr/local/lib/python3.8/site-packages/nautobot/extras/jobs.py", line 1127, in _run_job\n    output = job.run(data=data, commit=commit)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/jobs.py", line 48, in inner\n    return method(obj, data, commit)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/jobs.py", line 100, in run\n    get_refreshed_repos(job_obj=self, repo_type="intended_repository")\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/jobs.py", line 33, in get_refreshed_repos\n    ensure_git_repository(repository_record, job_obj.job_result)\n  File "/usr/local/lib/python3.8/site-packages/nautobot/extras/datasources/git.py", line 277, in ensure_git_repository\n    head = repo_helper.checkout(from_branch, head)\n  File "/usr/local/lib/python3.8/site-packages/nautobot/utilities/git.py", line 85, in checkout\n    self.fetch()\n  File "/usr/local/lib/python3.8/site-packages/nautobot/utilities/git.py", line 74, in fetch\n    self.repo.remotes.origin.fetch()\n  File "/usr/local/lib/python3.8/site-packages/git/remote.py", line 886, in fetch\n    res = self._get_fetch_info_from_stderr(proc, progress,\n  File "/usr/local/lib/python3.8/site-packages/git/remote.py", line 750, in _get_fetch_info_from_stderr\n    proc.wait(stderr=stderr_text)\n  File "/usr/local/lib/python3.8/site-packages/git/cmd.py", line 502, in wait\n    raise GitCommandError(remove_password(redacted) status, errstr)\ngit.exc.GitCommandError: Cmd('git') failed due to: exit code(128)\n  cmdline: git fetch -v origin\n  stderr: 'fatal: unable to access 'https://github.com/pke11y/pknet_intended.git/': GnuTLS recv error (-54): Error in the pull function.'\n\n```	2022-06-14 15:40:56.80612+00	\N	\N	df28ca8b-3e2c-4505-ba1a-402519363ed8
6e34a649-0730-4962-83b9-5696d100d11f	info	run	Database changes have been reverted due to error.	2022-06-14 15:40:56.810294+00	\N	\N	df28ca8b-3e2c-4505-ba1a-402519363ed8
cfbd629e-f5be-4ba4-b448-c83edbc8bba9	default	main	Creating/refreshing local copy of Git repository "gc-intended"...	2022-06-14 15:41:38.507891+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
c4511607-815d-44cc-b3e8-6839fa847c0c	success	main	Repository successfully refreshed	2022-06-14 15:41:39.195148+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
96bf2588-4ac7-414d-884f-949e577e82dc	info	main	The current Git repository hash is "fbf9b1ae89fa47d8d88ec681b7107c6ea175e219"	2022-06-14 15:41:39.2139+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
a7c33632-724c-4c3b-b704-bbf007d121ed	info	main	Refreshing data provided by gc-intended...	2022-06-14 15:41:39.217574+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
75bacbe2-79ca-4ed5-9d8d-109fd25c2259	info	main	Refreshing config context schemas...	2022-06-14 15:41:39.232269+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
9ded0347-63f9-4f9b-a746-e1b584b68e81	info	main	Refreshing config contexts...	2022-06-14 15:41:39.252415+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
6e2a4dd8-7695-43ce-ad3e-9f19b2afa5df	info	main	Refreshing jobs...	2022-06-14 15:41:39.298288+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
b8c076a6-98ca-4084-8d49-f77ba41b6412	warning	jobs	No `jobs` subdirectory found in Git repository	2022-06-14 15:41:39.303633+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
148b0a9d-9983-4d9b-9a64-b6ec30772ca4	info	main	Refreshing export templates...	2022-06-14 15:41:39.32628+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
9ac7746f-a4c8-4766-96b5-64558752442b	info	main	Refreshing Golden Config properties...	2022-06-14 15:41:39.352048+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
52027019-fba9-4647-b08f-c7ca304744df	info	main	Skipping sync for /opt/nautobot/git/gc-intended/golden_config because directory doesn't exist.	2022-06-14 15:41:39.357593+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
44f7e074-2f78-4734-a914-bce4ecafb0c3	info	main	Refreshing backup configs...	2022-06-14 15:41:39.372529+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
a478747b-cbe5-4cf8-94e8-839c7e2aac8c	success	main	Successfully Pulled git repo	2022-06-14 15:41:39.376008+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
3519cf31-a8ba-4333-b9c3-48ac46f91897	info	main	Refreshing intended configs...	2022-06-14 15:41:39.388719+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
35913995-7309-495b-94aa-78d0fa28067c	success	main	Successfully Pulled git repo	2022-06-14 15:41:39.392312+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
47274a40-11f0-4f21-8904-6148a7429dcd	info	main	Data refresh from gc-intended complete!	2022-06-14 15:41:39.407359+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
71424fa8-5bb1-4626-92d5-4bbaf6a419d1	info	main	Repository synchronization completed in 0 minutes, 0.98 seconds	2022-06-14 15:41:39.429054+00	\N	\N	c90eae05-5760-4084-830d-38b666c16514
d1fce574-c09e-487f-b980-1de9748ca87c	success	main	Repository successfully refreshed	2022-06-14 15:42:05.936969+00	\N	\N	3e584733-a213-4dee-8fa2-c367119b6e05
a3df786c-641e-43d2-b6f3-e431c9a96634	success	main	Repository successfully refreshed	2022-06-14 15:42:06.667278+00	\N	\N	3e584733-a213-4dee-8fa2-c367119b6e05
5e93dc4b-8290-4119-b0fb-b8b60193afe1	failure	run	An exception occurred: `NornirNautobotException: The base queryset didn't find any devices. Please check the Golden Config Setting scope.`\n```\nTraceback (most recent call last):\n  File "/usr/local/lib/python3.8/site-packages/nautobot/extras/jobs.py", line 1127, in _run_job\n    output = job.run(data=data, commit=commit)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/jobs.py", line 48, in inner\n    return method(obj, data, commit)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/jobs.py", line 103, in run\n    config_compliance(self, data)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/nornir_plays/config_compliance.py", line 135, in config_compliance\n    qs = get_job_filter(data)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/utilities/helper.py", line 47, in get_job_filter\n    raise NornirNautobotException(\nnornir_nautobot.exceptions.NornirNautobotException: The base queryset didn't find any devices. Please check the Golden Config Setting scope.\n\n```	2022-06-14 15:42:06.786922+00	\N	\N	3e584733-a213-4dee-8fa2-c367119b6e05
14520f62-691f-40b1-9b97-c9162e2202f4	info	run	Database changes have been reverted due to error.	2022-06-14 15:42:06.794449+00	\N	\N	3e584733-a213-4dee-8fa2-c367119b6e05
0a01254e-6310-44b6-a521-30cc4836152a	success	main	Repository successfully refreshed	2022-06-14 15:42:51.015298+00	\N	\N	f0dbab1f-0c71-403b-a04a-0c9cff06e150
b84c1ca9-8e20-4f9e-b648-a3af5a5e138a	success	main	Repository successfully refreshed	2022-06-14 15:42:51.73735+00	\N	\N	f0dbab1f-0c71-403b-a04a-0c9cff06e150
f840ca42-bd69-4487-abb1-a66582de86d1	failure	run	An exception occurred: `NornirNautobotException: The base queryset didn't find any devices. Please check the Golden Config Setting scope.`\n```\nTraceback (most recent call last):\n  File "/usr/local/lib/python3.8/site-packages/nautobot/extras/jobs.py", line 1127, in _run_job\n    output = job.run(data=data, commit=commit)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/jobs.py", line 48, in inner\n    return method(obj, data, commit)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/jobs.py", line 103, in run\n    config_compliance(self, data)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/nornir_plays/config_compliance.py", line 135, in config_compliance\n    qs = get_job_filter(data)\n  File "/usr/local/lib/python3.8/site-packages/nautobot_golden_config/utilities/helper.py", line 47, in get_job_filter\n    raise NornirNautobotException(\nnornir_nautobot.exceptions.NornirNautobotException: The base queryset didn't find any devices. Please check the Golden Config Setting scope.\n\n```	2022-06-14 15:42:51.834899+00	\N	\N	f0dbab1f-0c71-403b-a04a-0c9cff06e150
e3d80930-8947-422d-a484-397bc02f37b1	info	run	Database changes have been reverted due to error.	2022-06-14 15:42:51.839373+00	\N	\N	f0dbab1f-0c71-403b-a04a-0c9cff06e150
3428d553-5821-4fe1-80c1-61f9e69cf0d0	success	main	Repository successfully refreshed	2022-06-14 15:44:03.374803+00	\N	\N	3fd24104-829d-4199-ba12-4b72ed4b5cf6
ce32236d-4ab1-4082-af8b-e67793e1155a	success	main	Repository successfully refreshed	2022-06-14 15:44:04.106405+00	\N	\N	3fd24104-829d-4199-ba12-4b72ed4b5cf6
b4fcea50-5854-4e22-9655-ac88f69cc35a	success	run	Successfully tested compliance job.	2022-06-14 15:44:05.998891+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	3fd24104-829d-4199-ba12-4b72ed4b5cf6
b19c0e34-25e9-4db8-923c-c49f8b499fc0	success	run	Successfully tested compliance job.	2022-06-14 15:44:06.052851+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	3fd24104-829d-4199-ba12-4b72ed4b5cf6
c691b134-6ab2-4ab2-beac-61bb8976ebcd	success	run	Successfully tested compliance job.	2022-06-14 15:44:06.038563+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	3fd24104-829d-4199-ba12-4b72ed4b5cf6
02aabea7-8ee3-4a19-9685-0cddbc0e991c	success	main	Repository successfully refreshed	2022-06-14 20:41:38.125733+00	\N	\N	6ecf96c4-037a-4a55-9932-34d159fc9509
daf9a0f4-6e32-47d7-8c96-3b958de8298b	success	main	Repository successfully refreshed	2022-06-14 20:41:39.818246+00	\N	\N	6ecf96c4-037a-4a55-9932-34d159fc9509
39f7511c-81ca-491f-8fb2-556faeb101a8	success	run	Successfully tested compliance job.	2022-06-14 20:41:41.446871+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	6ecf96c4-037a-4a55-9932-34d159fc9509
63f9ee6c-e7ba-45ef-8fa8-af2c3fbd4134	success	run	Successfully tested compliance job.	2022-06-14 20:41:41.453804+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	6ecf96c4-037a-4a55-9932-34d159fc9509
656aea5c-6f32-4c70-b640-ce9c43ba094d	success	run	Successfully tested compliance job.	2022-06-14 20:41:41.49558+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	6ecf96c4-037a-4a55-9932-34d159fc9509
8e26730f-cd91-494c-95b4-ec7172da7d55	success	main	Repository successfully refreshed	2022-06-14 20:42:47.359252+00	\N	\N	dfc4e0e0-2027-463d-87bb-30ab23477c52
7263a250-d137-46a7-b9dc-aad926a10473	success	main	Repository successfully refreshed	2022-06-14 20:42:48.153565+00	\N	\N	dfc4e0e0-2027-463d-87bb-30ab23477c52
cd8bebce-7cbe-4923-bbd5-5077b170d542	success	run	Successfully tested compliance job.	2022-06-14 20:42:48.901422+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	dfc4e0e0-2027-463d-87bb-30ab23477c52
c0a40d7d-6bd1-4378-8c59-2fac3a6b4d66	success	run	Successfully tested compliance job.	2022-06-14 20:42:48.912989+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	dfc4e0e0-2027-463d-87bb-30ab23477c52
a4764baf-640f-41c9-96e4-405746dfb78e	success	run	Successfully tested compliance job.	2022-06-14 20:42:48.916888+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	dfc4e0e0-2027-463d-87bb-30ab23477c52
871b5b1f-5d77-4ce4-99d9-1a9f06636a5e	success	main	Repository successfully refreshed	2022-06-14 20:53:44.370039+00	\N	\N	ed184eb5-50d3-4cf2-81c2-4d0e4fc5f247
07528f5f-5db6-448c-a8f3-7949ed004bc9	success	main	Repository successfully refreshed	2022-06-14 20:53:45.094893+00	\N	\N	ed184eb5-50d3-4cf2-81c2-4d0e4fc5f247
ac4392c4-d3d1-4fe0-ba63-c6ccc00d8ab4	success	run	Successfully tested compliance job.	2022-06-14 20:53:45.710186+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	ed184eb5-50d3-4cf2-81c2-4d0e4fc5f247
9b4cfae3-1914-4381-835b-ffe5a9116a87	success	run	Successfully tested compliance job.	2022-06-14 20:53:45.714369+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	ed184eb5-50d3-4cf2-81c2-4d0e4fc5f247
81a24be8-a15e-4043-a681-45d1b7e480b6	success	run	Successfully tested compliance job.	2022-06-14 20:53:45.734215+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	ed184eb5-50d3-4cf2-81c2-4d0e4fc5f247
fbf8ae10-dfa8-431b-ae44-276cac07dc03	default	main	Creating/refreshing local copy of Git repository "gc-backup"...	2022-06-29 09:32:17.450331+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
80e926b2-1fcc-4363-ab1c-bf8638966493	success	main	Repository successfully refreshed	2022-06-29 09:32:18.864576+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
77b1f24c-c25a-448c-a279-b92ff333e62d	info	main	The current Git repository hash is "cf7acdbcb0ac35806f09e4dc300926f76d341d28"	2022-06-29 09:32:18.878674+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
37533a0f-44db-44ef-b1e7-743e41885bc2	info	main	Refreshing data provided by gc-backup...	2022-06-29 09:32:18.883107+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
f156256a-f2fe-4cb6-956c-20166663adbb	info	main	Refreshing config context schemas...	2022-06-29 09:32:18.896822+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
5e2b3d32-2b32-4205-a240-158eecedeeb2	info	main	Refreshing config contexts...	2022-06-29 09:32:18.916778+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
60a68d42-9d9d-4cd5-880e-fad14708bb67	info	main	Refreshing jobs...	2022-06-29 09:32:18.946285+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
28487863-6814-4326-8ba8-be5b9c94a1ac	warning	jobs	No `jobs` subdirectory found in Git repository	2022-06-29 09:32:18.948326+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
13dde82f-7f99-4a1d-af04-c605bfb8dfc0	info	main	Refreshing export templates...	2022-06-29 09:32:18.963542+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
8c3539be-6b1f-4ee6-b302-8128d68afba9	info	main	Refreshing Golden Config properties...	2022-06-29 09:32:18.974584+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
e3c880ad-87b2-4c5d-9fd8-80ffa61d77da	info	main	Skipping sync for /opt/nautobot/git/gc-backup/golden_config because directory doesn't exist.	2022-06-29 09:32:18.976728+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
16f9bfcd-9431-452e-b17f-205db5139a4f	info	main	Refreshing backup configs...	2022-06-29 09:32:18.984103+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
8dead3e2-028c-4b8a-9ae6-b7211e6b2549	success	main	Successfully Pulled git repo	2022-06-29 09:32:18.986046+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
9f0c1f25-c92e-490c-afc0-2d22d8082625	info	main	Refreshing intended configs...	2022-06-29 09:32:18.993867+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
fe00536e-107c-4343-9ff9-5d920c617f70	success	main	Successfully Pulled git repo	2022-06-29 09:32:18.996105+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
f3b955a5-0312-440e-a5e1-e2793e2ee476	info	main	Data refresh from gc-backup complete!	2022-06-29 09:32:19.005744+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
de490fe0-5acf-4e80-be25-580d6023a307	info	main	Repository synchronization completed in 0 minutes, 1.70 seconds	2022-06-29 09:32:19.015462+00	\N	\N	aaae4518-40b9-4f89-95fe-18a53882a77b
d53821f8-e1c8-4200-86fc-deb712672e38	default	main	Creating/refreshing local copy of Git repository "gc-intended"...	2022-06-29 09:32:30.703199+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
c18994bf-d87c-4a89-9ed4-a6c824834cef	success	main	Repository successfully refreshed	2022-06-29 09:32:31.909461+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
a6a671fb-ddea-415d-b799-1acc58eb408a	info	main	The current Git repository hash is "abd550a0ba1e374b57fdce10fcc2268a778d39ce"	2022-06-29 09:32:31.917641+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
8659eaf6-800f-475f-acae-0bde159eaa6a	info	main	Refreshing data provided by gc-intended...	2022-06-29 09:32:31.919973+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
34cdc45a-3661-4f32-8090-94bbe63ad12d	info	main	Refreshing config context schemas...	2022-06-29 09:32:31.93095+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
c3ef0249-866e-4c45-9d0e-cc28f5b31a1a	info	main	Refreshing config contexts...	2022-06-29 09:32:31.940408+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
47545ef2-ea23-48ed-879e-ff0cd457a79d	info	main	Refreshing jobs...	2022-06-29 09:32:31.958189+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
39452a20-d226-4e56-8728-41db0583428a	warning	jobs	No `jobs` subdirectory found in Git repository	2022-06-29 09:32:31.960782+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
7b3178c8-ecaf-4050-b71a-6d5fc929c1e2	info	main	Refreshing export templates...	2022-06-29 09:32:31.973801+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
df775133-9489-4765-bcb3-83b204193b95	info	main	Refreshing Golden Config properties...	2022-06-29 09:32:31.987511+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
ecf6b40e-114b-450c-bcc5-343810febfc4	info	main	Skipping sync for /opt/nautobot/git/gc-intended/golden_config because directory doesn't exist.	2022-06-29 09:32:31.98992+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
4639f89e-3206-4da5-8a55-20edbd3fc13b	info	main	Refreshing backup configs...	2022-06-29 09:32:31.998241+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
b04d921c-6ca2-436c-bc32-66f41a7f0726	success	main	Successfully Pulled git repo	2022-06-29 09:32:32.000756+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
5bf2b017-dd45-448f-91bd-1e6119112b3a	info	main	Refreshing intended configs...	2022-06-29 09:32:32.008874+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
1d5f5d66-8600-4a5d-8278-6d75a6e0b45b	success	main	Successfully Pulled git repo	2022-06-29 09:32:32.010721+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
d7c21e3c-d66f-4a98-97f5-67d4f53a244b	info	main	Data refresh from gc-intended complete!	2022-06-29 09:32:32.017844+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
f4b58b21-7e6d-42fc-9307-753e6b5b92d5	info	main	Repository synchronization completed in 0 minutes, 1.35 seconds	2022-06-29 09:32:32.029903+00	\N	\N	0d11ebff-2aee-489c-bfc5-938bdefc8991
f3648312-c454-4b68-8f58-54a35990f89c	success	main	Repository successfully refreshed	2022-06-29 09:33:55.200916+00	\N	\N	980eaff7-68cb-480c-b8c5-46f9aa398fad
8cec83e3-5cb2-4fed-a2c8-cb082eff168a	success	main	Repository successfully refreshed	2022-06-29 09:33:55.714688+00	\N	\N	980eaff7-68cb-480c-b8c5-46f9aa398fad
edba3f73-bd0d-4514-8670-cc177d3dccba	success	run	Successfully tested compliance job.	2022-06-29 09:33:56.96671+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	980eaff7-68cb-480c-b8c5-46f9aa398fad
14efc160-f9b4-4e0a-846c-b867a18e56fe	success	run	Successfully tested compliance job.	2022-06-29 09:33:56.97214+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	980eaff7-68cb-480c-b8c5-46f9aa398fad
862e884d-3049-4e42-88ca-ee3298b1f40d	success	run	Successfully tested compliance job.	2022-06-29 09:33:57.075255+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	980eaff7-68cb-480c-b8c5-46f9aa398fad
551a2f5a-d476-48da-b277-d6aa69626a99	success	main	Repository successfully refreshed	2022-06-29 09:34:45.13078+00	\N	\N	8ceaa0f4-3b02-4153-8414-36dcdb6486b2
e7f5cf4b-ad47-4fec-b972-2548bf99f36f	success	main	Repository successfully refreshed	2022-06-29 09:34:45.733304+00	\N	\N	8ceaa0f4-3b02-4153-8414-36dcdb6486b2
b57bf997-7593-4529-ad8e-5977a32d70ba	success	run	Successfully tested compliance job.	2022-06-29 09:34:46.664809+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	8ceaa0f4-3b02-4153-8414-36dcdb6486b2
941990f9-d794-4ca2-b716-0fbecd40d6fd	success	run	Successfully tested compliance job.	2022-06-29 09:34:46.6679+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	8ceaa0f4-3b02-4153-8414-36dcdb6486b2
32a69d56-a5af-48d6-a4c3-5510a3e8fbd4	success	run	Successfully tested compliance job.	2022-06-29 09:34:46.67335+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	8ceaa0f4-3b02-4153-8414-36dcdb6486b2
d01203b1-435d-43bc-8378-ba1b2fdd2d59	success	main	Repository successfully refreshed	2022-06-29 09:35:48.873015+00	\N	\N	47040487-5145-4b63-9bcb-6f8ec4a05374
b640cea1-445e-4d6b-957c-1f6dc1538b23	success	main	Repository successfully refreshed	2022-06-29 09:35:49.563469+00	\N	\N	47040487-5145-4b63-9bcb-6f8ec4a05374
e2dfbd4f-2bb3-45a0-a6fe-fee5c2fa4ff0	success	run	Successfully tested compliance job.	2022-06-29 09:35:50.8001+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	47040487-5145-4b63-9bcb-6f8ec4a05374
199e2d1f-79cc-40bc-8a50-2e1ca16e9579	success	run	Successfully tested compliance job.	2022-06-29 09:35:50.823554+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	47040487-5145-4b63-9bcb-6f8ec4a05374
1d320716-cf7a-41ed-841d-20264549a839	success	run	Successfully tested compliance job.	2022-06-29 09:35:50.840589+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	47040487-5145-4b63-9bcb-6f8ec4a05374
c9607a87-ba57-4694-ae7e-b061f76b1f5b	success	main	Repository successfully refreshed	2022-06-29 10:01:39.998734+00	\N	\N	94e282c8-ade2-4d1b-b470-9d78d24cbfff
9c5d896c-41b8-4e99-a3ca-dd31b1840c42	success	main	Repository successfully refreshed	2022-06-29 10:01:41.63179+00	\N	\N	94e282c8-ade2-4d1b-b470-9d78d24cbfff
551a600f-0571-4c1a-adf8-0009dd1924b0	success	run	Successfully tested compliance job.	2022-06-29 10:01:43.715858+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	94e282c8-ade2-4d1b-b470-9d78d24cbfff
7534ee6f-7a3c-40e2-9841-4c3af6a1efa5	success	run	Successfully tested compliance job.	2022-06-29 10:01:43.875182+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	94e282c8-ade2-4d1b-b470-9d78d24cbfff
ab0cad3a-11ce-4f6b-9229-cd695fd79d5e	success	run	Successfully tested compliance job.	2022-06-29 10:01:43.850948+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	94e282c8-ade2-4d1b-b470-9d78d24cbfff
e9e8d590-2f32-40ca-aab6-a7748d13d468	success	main	Repository successfully refreshed	2022-06-29 10:12:28.396306+00	\N	\N	b5748d09-efe9-4c33-bdcf-14aab1be6ab0
d1057ca9-97e1-4d44-a8d0-ad7e03a4ad59	success	main	Repository successfully refreshed	2022-06-29 10:12:29.769397+00	\N	\N	b5748d09-efe9-4c33-bdcf-14aab1be6ab0
14c98208-5e9d-4b5b-827e-9b00c604e222	success	run	Successfully tested compliance job.	2022-06-29 10:12:31.949912+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	b5748d09-efe9-4c33-bdcf-14aab1be6ab0
551df636-ec5a-471a-8639-327373676336	success	run	Successfully tested compliance job.	2022-06-29 10:12:32.090317+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	b5748d09-efe9-4c33-bdcf-14aab1be6ab0
8989f63f-0d45-441b-8fa3-dd2d756d23cb	success	run	Successfully tested compliance job.	2022-06-29 10:12:32.094035+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	b5748d09-efe9-4c33-bdcf-14aab1be6ab0
58d0ddb5-585c-4e60-8fb9-22470f2af771	success	main	Repository successfully refreshed	2022-06-29 10:21:10.315651+00	\N	\N	34141205-b46c-4b3c-afe8-3a33a2505105
cff0dc1b-2524-44ad-b243-d14e592c08a7	success	main	Repository successfully refreshed	2022-06-29 10:21:11.155965+00	\N	\N	34141205-b46c-4b3c-afe8-3a33a2505105
3743e469-db53-43df-909b-9182a7dea3b3	success	run	Successfully tested compliance job.	2022-06-29 10:21:13.279362+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	34141205-b46c-4b3c-afe8-3a33a2505105
2379e08d-b07b-4714-82aa-ee4164699ee0	success	run	Successfully tested compliance job.	2022-06-29 10:21:13.3095+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	34141205-b46c-4b3c-afe8-3a33a2505105
c92d6cf9-9af3-407f-b948-697dd29ee331	success	run	Successfully tested compliance job.	2022-06-29 10:21:13.316402+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	34141205-b46c-4b3c-afe8-3a33a2505105
cd5d8f75-e4c8-47b3-b196-471533cffb22	success	main	Repository successfully refreshed	2022-06-29 10:39:44.416165+00	\N	\N	ddc2f575-686d-4572-bb6e-9d96e0eead7d
ccafab00-92a1-4e55-88d7-db8f48842fb0	success	main	Repository successfully refreshed	2022-06-29 10:39:45.857216+00	\N	\N	ddc2f575-686d-4572-bb6e-9d96e0eead7d
c40f33c9-adf8-4df2-bd41-05b16776db99	success	run	Successfully tested compliance job.	2022-06-29 10:39:48.918901+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	ddc2f575-686d-4572-bb6e-9d96e0eead7d
1d43e0dd-fad9-46f8-807e-faab9e22063b	success	run	Successfully tested compliance job.	2022-06-29 10:39:48.980358+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	ddc2f575-686d-4572-bb6e-9d96e0eead7d
ed46fbd6-a57e-4e89-8034-b2469a60e909	success	run	Successfully tested compliance job.	2022-06-29 10:39:49.021366+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	ddc2f575-686d-4572-bb6e-9d96e0eead7d
181a227c-fa67-4085-95ea-69ce8a104cc9	success	main	Repository successfully refreshed	2022-06-29 10:54:15.939815+00	\N	\N	70294a44-c833-4616-b4ca-766a7d214196
8dd2625c-cb09-4b8e-94dd-8809b6ff62aa	success	main	Repository successfully refreshed	2022-06-29 10:54:17.249902+00	\N	\N	70294a44-c833-4616-b4ca-766a7d214196
56f4f372-46bd-4ad4-b948-ca3ce7f2ba85	success	run	Successfully tested compliance job.	2022-06-29 10:54:19.235465+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	70294a44-c833-4616-b4ca-766a7d214196
e9d54350-e465-44b7-8954-d5810ebea5bf	success	run	Successfully tested compliance job.	2022-06-29 10:54:19.275794+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	70294a44-c833-4616-b4ca-766a7d214196
fc427fc0-f834-4331-b548-0c6cd6f99b28	success	run	Successfully tested compliance job.	2022-06-29 10:54:19.331083+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	70294a44-c833-4616-b4ca-766a7d214196
4cb9c644-f31a-47dc-ac48-59208888794f	success	main	Repository successfully refreshed	2022-06-29 10:58:50.397289+00	\N	\N	3eb64346-e83e-4b8b-bb35-bc27fb5d6b9f
79279396-2280-497f-b7c1-33427e684d54	success	main	Repository successfully refreshed	2022-06-29 10:58:51.784053+00	\N	\N	3eb64346-e83e-4b8b-bb35-bc27fb5d6b9f
7cb0f75f-fc66-4ac6-801d-ee6b50ad104d	success	run	Successfully tested compliance job.	2022-06-29 10:58:54.164784+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	3eb64346-e83e-4b8b-bb35-bc27fb5d6b9f
f6868102-f731-4e9a-86b7-b007b1eb41b6	success	run	Successfully tested compliance job.	2022-06-29 10:58:54.136765+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	3eb64346-e83e-4b8b-bb35-bc27fb5d6b9f
c4ac9c3c-abd0-409b-a307-a7293c2f708e	success	run	Successfully tested compliance job.	2022-06-29 10:58:54.080797+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	3eb64346-e83e-4b8b-bb35-bc27fb5d6b9f
0fc16c32-1ce2-4524-8d30-0a00122d373a	success	main	Repository successfully refreshed	2022-06-29 11:05:28.020098+00	\N	\N	7f60ced5-091f-42a6-9768-a1b72e516b0d
3caefd08-e53a-4823-b6e2-8ee4b7354e25	success	main	Repository successfully refreshed	2022-06-29 11:05:29.522905+00	\N	\N	7f60ced5-091f-42a6-9768-a1b72e516b0d
940b7b6d-058f-4d0a-a2cb-3b248f104979	success	run	Successfully tested compliance job.	2022-06-29 11:05:31.674693+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	7f60ced5-091f-42a6-9768-a1b72e516b0d
8290ab15-1451-4875-88ae-220ba200989a	success	run	Successfully tested compliance job.	2022-06-29 11:05:31.663091+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	7f60ced5-091f-42a6-9768-a1b72e516b0d
923fb53a-1801-41ff-bbb2-86519ca8d7be	success	run	Successfully tested compliance job.	2022-06-29 11:05:31.64096+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	7f60ced5-091f-42a6-9768-a1b72e516b0d
996d51bb-9b6a-4b81-b898-56f9c0144b68	success	main	Repository successfully refreshed	2022-06-29 11:07:54.234262+00	\N	\N	f222b454-7f92-4e6f-bed3-ab3fc0a2ece4
7d40fd99-66f2-4db5-b842-29c2977d2594	success	main	Repository successfully refreshed	2022-06-29 11:07:55.098175+00	\N	\N	f222b454-7f92-4e6f-bed3-ab3fc0a2ece4
ef9a26e4-bdf8-42b2-8929-5f3a05a2542f	success	run	Successfully tested compliance job.	2022-06-29 11:07:57.169457+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	f222b454-7f92-4e6f-bed3-ab3fc0a2ece4
78e01755-744a-4873-ba0f-ff113286bf4c	success	run	Successfully tested compliance job.	2022-06-29 11:07:57.202358+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	f222b454-7f92-4e6f-bed3-ab3fc0a2ece4
6cd78747-5746-499a-b5ea-5e7d42fda08d	success	run	Successfully tested compliance job.	2022-06-29 11:07:57.212153+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	f222b454-7f92-4e6f-bed3-ab3fc0a2ece4
0c20ec08-5f00-4b0e-9b0c-e44b92a86d19	success	main	Repository successfully refreshed	2022-06-29 11:10:50.941952+00	\N	\N	a777a68d-9784-470a-ad34-2672cb228255
081d193c-e950-43f6-9201-61dd09f25d49	success	main	Repository successfully refreshed	2022-06-29 11:10:52.604426+00	\N	\N	a777a68d-9784-470a-ad34-2672cb228255
ead06174-fbe8-4626-9e6e-ac95665333c4	success	run	Successfully tested compliance job.	2022-06-29 11:10:54.642633+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	a777a68d-9784-470a-ad34-2672cb228255
0529d2f8-50f7-4456-9a7b-b73e4c4f6d9d	success	run	Successfully tested compliance job.	2022-06-29 11:10:54.706868+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	a777a68d-9784-470a-ad34-2672cb228255
26533385-4bf4-410e-a588-3cbaa70a7847	success	run	Successfully tested compliance job.	2022-06-29 11:10:54.792141+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	a777a68d-9784-470a-ad34-2672cb228255
1b0d0ebe-4441-440c-8bf7-11fa6b33b8b2	success	main	Repository successfully refreshed	2022-06-29 11:13:50.120624+00	\N	\N	8e8e2c91-e5f0-43d7-91f6-a6578c3e287c
f1211c0b-b2a7-44a4-9b47-f404a2bcbc62	success	main	Repository successfully refreshed	2022-06-29 11:13:51.732727+00	\N	\N	8e8e2c91-e5f0-43d7-91f6-a6578c3e287c
d15dd437-5b78-4bfd-9249-e59ee1185400	success	run	Successfully tested compliance job.	2022-06-29 11:13:53.76666+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	8e8e2c91-e5f0-43d7-91f6-a6578c3e287c
8f20cb2b-e48d-47d0-bfe3-9c3cbf771df1	success	run	Successfully tested compliance job.	2022-06-29 11:13:53.798752+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	8e8e2c91-e5f0-43d7-91f6-a6578c3e287c
634a7ef3-1f22-4183-82a5-f8d8bdd0a1ea	success	run	Successfully tested compliance job.	2022-06-29 11:13:53.834739+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	8e8e2c91-e5f0-43d7-91f6-a6578c3e287c
e6503586-de65-4604-8196-0776713a7930	success	main	Repository successfully refreshed	2022-06-29 11:25:56.433632+00	\N	\N	90038c1d-1cb7-4f32-a906-481a226ebfbe
b5cd54b5-36ca-40eb-91a0-41ca50b6c43b	success	main	Repository successfully refreshed	2022-06-29 11:25:58.04267+00	\N	\N	90038c1d-1cb7-4f32-a906-481a226ebfbe
dcd54b7d-572f-4919-b419-15aa721352d7	failure	run	RENDER COMPLIANCE TASK GROUP failed: 'NoneType' object has no attribute 'groups'2022-06-29 11:26:00.113611+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	90038c1d-1cb7-4f32-a906-481a226ebfbe
f0a0e0f9-90e5-46a2-ba90-05d4a4c79269	success	run	Successfully tested compliance job.	2022-06-29 11:26:00.369196+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	90038c1d-1cb7-4f32-a906-481a226ebfbe
26904512-0f0a-4ab0-a49f-0251e5f6c6a7	success	run	Successfully tested compliance job.	2022-06-29 11:26:00.531432+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	90038c1d-1cb7-4f32-a906-481a226ebfbe
74739e4b-e2ea-4792-a3e9-3892b09ce017	success	main	Repository successfully refreshed	2022-06-29 11:29:16.335474+00	\N	\N	df3f91d7-7ec8-409b-96f1-7fe6121bd719
a08cf633-4585-4381-8355-ebb0106b0d92	success	main	Repository successfully refreshed	2022-06-29 11:29:17.995369+00	\N	\N	df3f91d7-7ec8-409b-96f1-7fe6121bd719
3f37deeb-55b8-43d9-b2f4-463672ea9639	success	run	Successfully tested compliance job.	2022-06-29 11:29:20.585607+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	df3f91d7-7ec8-409b-96f1-7fe6121bd719
26786292-89d4-4eff-9507-7dd6e73425b2	success	run	Successfully tested compliance job.	2022-06-29 11:29:20.537481+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	df3f91d7-7ec8-409b-96f1-7fe6121bd719
5c1f9eb2-54ae-4c5a-93ca-5b248b7b69bc	success	run	Successfully tested compliance job.	2022-06-29 11:29:20.509306+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	df3f91d7-7ec8-409b-96f1-7fe6121bd719
dfc24243-d6a8-4ea4-bec2-146da97ec85b	success	main	Repository successfully refreshed	2022-06-29 11:35:11.563054+00	\N	\N	b52521de-adc3-4780-acc3-bc2404d6b46a
0cb6b18c-0cfe-4d5c-9355-8bab7f0bb3e6	success	main	Repository successfully refreshed	2022-06-29 11:35:13.104222+00	\N	\N	b52521de-adc3-4780-acc3-bc2404d6b46a
4c0d2b01-3a32-4817-aeeb-cae15608d827	success	run	Successfully tested compliance job.	2022-06-29 11:35:15.758844+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	b52521de-adc3-4780-acc3-bc2404d6b46a
f0b62e83-e96d-4ca5-9f2c-10fa89ffe5bb	success	run	Successfully tested compliance job.	2022-06-29 11:35:15.779132+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	b52521de-adc3-4780-acc3-bc2404d6b46a
b652b547-c272-4b7d-9e62-cb2712997482	success	run	Successfully tested compliance job.	2022-06-29 11:35:15.783044+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	b52521de-adc3-4780-acc3-bc2404d6b46a
00dd89ac-93a6-466a-8431-c58b3d1a8088	success	main	Repository successfully refreshed	2022-06-29 11:44:46.913283+00	\N	\N	332891ec-0cba-45f6-a448-3cf73b07f0d8
c5659abb-6fd8-4fdb-91c4-13a81caebef5	success	main	Repository successfully refreshed	2022-06-29 11:44:48.518455+00	\N	\N	332891ec-0cba-45f6-a448-3cf73b07f0d8
ad3d81d9-f19f-4aaa-88cd-4fed2b3e3d7b	success	run	Successfully tested compliance job.	2022-06-29 11:44:51.260063+00	clab-basic-R3	/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/	332891ec-0cba-45f6-a448-3cf73b07f0d8
f94d53a2-1659-4210-b803-885f22d02e38	success	run	Successfully tested compliance job.	2022-06-29 11:44:51.213428+00	clab-basic-R2	/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/	332891ec-0cba-45f6-a448-3cf73b07f0d8
fa4226ed-9f80-466d-a1f7-c65e277ad508	success	run	Successfully tested compliance job.	2022-06-29 11:44:51.39445+00	clab-basic-R1	/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/	332891ec-0cba-45f6-a448-3cf73b07f0d8
\.


--
-- Data for Name: extras_jobresult; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_jobresult (id, name, created, completed, status, data, job_id, obj_type_id, user_id, _custom_field_data, schedule_id, job_model_id) FROM stdin;
3e584733-a213-4dee-8fa2-c367119b6e05	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-14 15:42:05.049477+00	2022-06-14 15:42:06.811007+00	errored	{"output": ""}	ab3a14f1-e02e-405e-8f88-c9d355e7c522	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	1b919031-52b6-4030-a519-a919d1049be5
ed184eb5-50d3-4cf2-81c2-4d0e4fc5f247	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-14 20:53:43.535355+00	2022-06-14 20:53:45.777031+00	completed	{"output": ""}	9ca2518e-929c-4ba7-9b13-7f643f884478	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	1b919031-52b6-4030-a519-a919d1049be5
f0dbab1f-0c71-403b-a04a-0c9cff06e150	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-14 15:42:50.123868+00	2022-06-14 15:42:51.851724+00	errored	{"output": ""}	57c6be5f-ba1f-4840-b019-957b3c04e606	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	1b919031-52b6-4030-a519-a919d1049be5
9a69dfa8-cb08-47dc-ab01-33a10b0628e4	gc-backup	2022-06-14 15:22:16.034862+00	2022-06-14 15:22:18.720952+00	completed	\N	62f205ee-f640-4001-9ce0-d004db8f89e7	75	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	\N
3fd24104-829d-4199-ba12-4b72ed4b5cf6	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-14 15:44:02.518318+00	2022-06-14 15:44:06.851853+00	completed	{"output": ""}	739b8df5-1c25-4253-b0ba-1b52ce6d5908	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	1b919031-52b6-4030-a519-a919d1049be5
6ecf96c4-037a-4a55-9932-34d159fc9509	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-14 20:41:36.368983+00	2022-06-14 20:41:42.01793+00	completed	{"output": ""}	032bca9f-54c7-4b65-999c-72e5ba3c3b3a	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	1b919031-52b6-4030-a519-a919d1049be5
7c097e06-3ecc-4851-9764-db4d2cd147b1	gc-intended	2022-06-14 15:22:56.654609+00	2022-06-14 15:22:58.788127+00	completed	\N	ad79b7bd-e2d5-4bb9-bd22-52d5d17f020d	75	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	\N
df28ca8b-3e2c-4505-ba1a-402519363ed8	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-14 15:39:53.21109+00	2022-06-14 15:40:56.825436+00	errored	{"output": ""}	13b7adb9-8663-4246-b519-f0785a00dad6	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	1b919031-52b6-4030-a519-a919d1049be5
dfc4e0e0-2027-463d-87bb-30ab23477c52	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-14 20:42:46.516769+00	2022-06-14 20:42:48.96811+00	completed	{"output": ""}	8aa2f70a-90b2-47d4-87f1-4eaad71c6511	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	1b919031-52b6-4030-a519-a919d1049be5
c90eae05-5760-4084-830d-38b666c16514	gc-intended	2022-06-14 15:41:38.448174+00	2022-06-14 15:41:39.428901+00	completed	\N	dd44ce52-647a-4519-a87f-cde33ee3159c	75	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	\N
b5748d09-efe9-4c33-bdcf-14aab1be6ab0	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 10:12:26.689422+00	2022-06-29 10:12:32.156167+00	completed	{"output": ""}	ec4123e6-976f-404f-9f5f-9360729897d0	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
8ceaa0f4-3b02-4153-8414-36dcdb6486b2	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 09:34:44.536886+00	2022-06-29 09:34:46.742617+00	completed	{"output": ""}	440d5e9c-a21d-4e70-9b54-5c334c60349f	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
7f60ced5-091f-42a6-9768-a1b72e516b0d	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 11:05:26.36558+00	2022-06-29 11:05:32.217757+00	completed	{"output": ""}	f0837654-9d52-4f49-98d1-98f8b39a535a	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
70294a44-c833-4616-b4ca-766a7d214196	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 10:54:13.904572+00	2022-06-29 10:54:20.137479+00	completed	{"output": ""}	fb311ef0-3fc5-42ab-868b-8a88123559e4	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
47040487-5145-4b63-9bcb-6f8ec4a05374	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 09:35:47.936498+00	2022-06-29 09:35:50.906139+00	completed	{"output": ""}	0f9e46a8-2151-41e9-a65d-c1ce2d2c025f	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
aaae4518-40b9-4f89-95fe-18a53882a77b	gc-backup	2022-06-29 09:32:17.319449+00	2022-06-29 09:32:19.015382+00	completed	\N	bb513e3d-d056-423e-a22d-afc767bce8e4	75	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	\N
34141205-b46c-4b3c-afe8-3a33a2505105	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 10:21:09.320205+00	2022-06-29 10:21:13.387141+00	completed	{"output": ""}	f889dade-8dea-465b-b754-51843a37da6a	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
94e282c8-ade2-4d1b-b470-9d78d24cbfff	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 10:01:37.838505+00	2022-06-29 10:01:43.960754+00	completed	{"output": ""}	bd4bd8e9-8c70-42ca-a2f5-d0f167ebd043	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
0d11ebff-2aee-489c-bfc5-938bdefc8991	gc-intended	2022-06-29 09:32:30.675483+00	2022-06-29 09:32:32.029803+00	completed	\N	3380aca8-b4b8-4388-8d2b-3ee1ea70b4a2	75	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	\N
3eb64346-e83e-4b8b-bb35-bc27fb5d6b9f	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 10:58:48.692424+00	2022-06-29 10:58:54.784871+00	completed	{"output": ""}	50d88a6e-7428-4318-b849-83b78a79feb1	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
ddc2f575-686d-4572-bb6e-9d96e0eead7d	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 10:39:42.521949+00	2022-06-29 10:39:49.624682+00	completed	{"output": ""}	fdcfbbd1-3d66-4722-8076-8fea2acc30cb	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
980eaff7-68cb-480c-b8c5-46f9aa398fad	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 09:33:54.584467+00	2022-06-29 09:33:57.307536+00	completed	{"output": ""}	675f59fd-d24a-4c87-8394-5ead2dea2b45	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
90038c1d-1cb7-4f32-a906-481a226ebfbe	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 11:25:54.19072+00	2022-06-29 11:26:00.829268+00	failed	{"output": ""}	b427c417-d850-496e-8a35-612b4493b4bb	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
f222b454-7f92-4e6f-bed3-ab3fc0a2ece4	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 11:07:53.468157+00	2022-06-29 11:07:57.276927+00	completed	{"output": ""}	1dd69fc4-ad60-4b25-b0ff-a2e97c5b70f7	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
8e8e2c91-e5f0-43d7-91f6-a6578c3e287c	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 11:13:48.457276+00	2022-06-29 11:13:54.550345+00	completed	{"output": ""}	33ebba6d-170d-49b8-b185-69ba536763cc	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
a777a68d-9784-470a-ad34-2672cb228255	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 11:10:49.159955+00	2022-06-29 11:10:55.501771+00	completed	{"output": ""}	e57c1bf4-5048-45fb-a8b7-3b83c558e9d2	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
332891ec-0cba-45f6-a448-3cf73b07f0d8	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 11:44:44.74195+00	2022-06-29 11:44:51.775872+00	completed	{"output": ""}	bcaa17eb-332c-489b-8db1-b5d558a3a34b	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
b52521de-adc3-4780-acc3-bc2404d6b46a	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 11:35:09.593097+00	2022-06-29 11:35:16.523829+00	completed	{"output": ""}	f2705e9b-9e72-4712-801b-b99fab2161df	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
df3f91d7-7ec8-409b-96f1-7fe6121bd719	plugins/nautobot_golden_config.jobs/ComplianceJob	2022-06-29 11:29:14.469291+00	2022-06-29 11:29:20.804934+00	completed	{"output": ""}	12509d2b-696e-4c75-910f-18764dbc4ebb	12	a8766f1b-01a6-4f9d-8255-18c77e628b60	{}	\N	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, object_data, changed_object_type_id, related_object_type_id, user_id, object_data_v2) FROM stdin;
630c1da7-cab0-430c-b588-37b42eee204c	2022-06-14 09:11:54.25845+00	admin	bdfdb6da-4557-48ce-9224-63eb08977201	create	75bcfef4-6eb4-44a5-bc8e-558e70e44978	\N	EOS	{"name": "EOS", "slug": "arista_eos", "created": "2022-06-14", "description": "", "napalm_args": null, "last_updated": "2022-06-14T09:11:54.222Z", "manufacturer": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "custom_fields": {}, "napalm_driver": ""}	51	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "url": "/api/dcim/platforms/75bcfef4-6eb4-44a5-bc8e-558e70e44978/", "name": "EOS", "slug": "arista_eos", "created": "2022-06-14", "display": "EOS", "description": "", "napalm_args": null, "last_updated": "2022-06-14T09:11:54.222154Z", "manufacturer": {"id": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "url": "/api/dcim/manufacturers/dbb2897a-9ade-414f-97fb-cca1a92aaefb/", "name": "Arista", "slug": "arista", "display": "Arista"}, "custom_fields": {}, "napalm_driver": ""}
d85269f8-29ee-46ec-9102-f4841ea746fd	2022-06-14 09:49:42.83628+00	admin	dc869896-5c29-431c-b408-1ecaf39ffbd9	create	0c1c9714-449d-4535-b366-8bac1f4c9a71	\N	Dublin	{"asn": null, "name": "Dublin", "slug": "dublin", "tags": [], "region": null, "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": null, "created": "2022-06-14", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": "", "description": "", "contact_name": "", "last_updated": "2022-06-14T09:49:42.512Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}	2	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "asn": null, "url": "/api/dcim/sites/0c1c9714-449d-4535-b366-8bac1f4c9a71/", "name": "Dublin", "slug": "dublin", "tags": [], "region": null, "status": {"label": "Active", "value": "active"}, "tenant": null, "created": "2022-06-14", "display": "Dublin", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": "", "description": "", "contact_name": "", "last_updated": "2022-06-14T09:49:42.512875Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}
21f752d4-9a93-4d50-9342-8d8ad7d22671	2022-06-14 09:49:57.216279+00	admin	082e0657-1e2d-493b-9c2f-b59a13a93613	create	d52e9447-b1b4-421b-a49f-a540fa6824e7	\N	Converged Cloud	{"name": "Converged Cloud", "slug": "converged-cloud", "tags": [], "group": null, "created": "2022-06-14", "comments": "", "description": "", "last_updated": "2022-06-14T09:49:57.030Z", "custom_fields": {}}	99	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "d52e9447-b1b4-421b-a49f-a540fa6824e7", "url": "/api/tenancy/tenants/d52e9447-b1b4-421b-a49f-a540fa6824e7/", "name": "Converged Cloud", "slug": "converged-cloud", "tags": [], "group": null, "created": "2022-06-14", "display": "Converged Cloud", "comments": "", "description": "", "last_updated": "2022-06-14T09:49:57.030043Z", "custom_fields": {}}
a864589f-34a9-41a4-b2b6-c425938ed537	2022-06-14 09:50:06.152959+00	admin	f935abdf-9d6c-446e-8664-d76c00396f6e	create	97c019ba-0cfd-426f-9211-3ca7f6dd24d3	\N	HEC	{"name": "HEC", "slug": "hec", "tags": [], "group": null, "created": "2022-06-14", "comments": "", "description": "", "last_updated": "2022-06-14T09:50:06.111Z", "custom_fields": {}}	99	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "url": "/api/tenancy/tenants/97c019ba-0cfd-426f-9211-3ca7f6dd24d3/", "name": "HEC", "slug": "hec", "tags": [], "group": null, "created": "2022-06-14", "display": "HEC", "comments": "", "description": "", "last_updated": "2022-06-14T09:50:06.111432Z", "custom_fields": {}}
9c8e46f0-a057-4575-8867-064f9af4e9be	2022-06-14 09:50:24.723231+00	admin	351b41ab-4256-4d35-82fc-a0704110af10	create	6e139e4c-12bd-4bd3-ab50-50fce2f1f36c	\N	aaa	{"name": "aaa", "slug": "aaa", "tags": [], "created": "2022-06-14", "description": "", "last_updated": "2022-06-14T09:50:24.669Z", "custom_fields": {}}	110	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "6e139e4c-12bd-4bd3-ab50-50fce2f1f36c", "url": "/api/plugins/golden-config/compliance-feature/6e139e4c-12bd-4bd3-ab50-50fce2f1f36c/", "name": "aaa", "slug": "aaa", "tags": [], "created": "2022-06-14", "display": "aaa", "description": "", "last_updated": "2022-06-14T09:50:24.669418Z", "custom_fields": {}, "computed_fields": {}, "_custom_field_data": {}}
de2652e6-c084-4871-b062-fe13b8f32614	2022-06-14 09:50:32.4682+00	admin	1990a15c-0041-49b2-a90f-0863737ca18e	create	398c32e8-0038-4855-a121-95c198e37b77	\N	dns	{"name": "dns", "slug": "dns", "tags": [], "created": "2022-06-14", "description": "", "last_updated": "2022-06-14T09:50:32.417Z", "custom_fields": {}}	110	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "398c32e8-0038-4855-a121-95c198e37b77", "url": "/api/plugins/golden-config/compliance-feature/398c32e8-0038-4855-a121-95c198e37b77/", "name": "dns", "slug": "dns", "tags": [], "created": "2022-06-14", "display": "dns", "description": "", "last_updated": "2022-06-14T09:50:32.417267Z", "custom_fields": {}, "computed_fields": {}, "_custom_field_data": {}}
13a1cdb6-e269-4341-a080-1efd524a7ee8	2022-06-14 09:50:48.208782+00	admin	7d788d80-846a-4543-8d8b-8e4b257b9167	create	9c2d2d8d-1ebd-4c64-84b4-d1984c36569b	\N	ipv6	{"name": "ipv6", "slug": "ipv6", "tags": [], "created": "2022-06-14", "description": "", "last_updated": "2022-06-14T09:50:48.158Z", "custom_fields": {}}	110	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "9c2d2d8d-1ebd-4c64-84b4-d1984c36569b", "url": "/api/plugins/golden-config/compliance-feature/9c2d2d8d-1ebd-4c64-84b4-d1984c36569b/", "name": "ipv6", "slug": "ipv6", "tags": [], "created": "2022-06-14", "display": "ipv6", "description": "", "last_updated": "2022-06-14T09:50:48.158108Z", "custom_fields": {}, "computed_fields": {}, "_custom_field_data": {}}
78b048a2-00c1-4037-8438-22dc50959fa7	2022-06-14 09:51:06.459538+00	admin	c19772e7-3eb2-4c76-8d5a-2e094a682b8e	create	80bfb542-c7ff-4db8-a38d-2435def2a7b9	\N	EOS - ipv6	{"tags": [], "created": "2022-06-14", "feature": "9c2d2d8d-1ebd-4c64-84b4-d1984c36569b", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "config_type": "cli", "description": "", "last_updated": "2022-06-14T09:51:06.406Z", "match_config": "ipv6", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "url": "/api/plugins/golden-config/compliance-rule/80bfb542-c7ff-4db8-a38d-2435def2a7b9/", "tags": [], "created": "2022-06-14", "display": "EOS - ipv6", "feature": "9c2d2d8d-1ebd-4c64-84b4-d1984c36569b", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "config_type": "cli", "description": "", "last_updated": "2022-06-14T09:51:06.406629Z", "match_config": "ipv6", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
97012ece-b6b4-4efd-b27c-41d835982448	2022-06-14 09:51:22.733951+00	admin	0715ced6-0084-4d52-b016-acebff6d07f7	create	f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c	\N	EOS - aaa	{"tags": [], "created": "2022-06-14", "feature": "6e139e4c-12bd-4bd3-ab50-50fce2f1f36c", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "config_type": "cli", "description": "", "last_updated": "2022-06-14T09:51:22.684Z", "match_config": "aaa\\r\\nno aaa\\r\\nmanagement\\r\\nusername\\r\\nrole\\r\\nradius-server", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "url": "/api/plugins/golden-config/compliance-rule/f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c/", "tags": [], "created": "2022-06-14", "display": "EOS - aaa", "feature": "6e139e4c-12bd-4bd3-ab50-50fce2f1f36c", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "config_type": "cli", "description": "", "last_updated": "2022-06-14T09:51:22.684307Z", "match_config": "aaa\\r\\nno aaa\\r\\nmanagement\\r\\nusername\\r\\nrole\\r\\nradius-server", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
4bea5583-69e5-483d-96ca-ab093cdc65b5	2022-06-14 15:44:05.857117+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	7e362657-11a6-44df-ba6a-d11dfa95eabf	\N	clab-basic-R3 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T15:44:05.844Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a5b23985-8118-4119-8358-048f7f414ca1	2022-06-14 09:51:49.186881+00	admin	fad95de1-c609-4d75-8919-085e4a7efd37	create	8adf858e-c6b7-43b0-95c3-ba5a2cebf852	\N	EOS - dns	{"tags": [], "created": "2022-06-14", "feature": "398c32e8-0038-4855-a121-95c198e37b77", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "config_type": "cli", "description": "", "last_updated": "2022-06-14T09:51:49.137Z", "match_config": "ip domain\\r\\ndns domain", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "url": "/api/plugins/golden-config/compliance-rule/8adf858e-c6b7-43b0-95c3-ba5a2cebf852/", "tags": [], "created": "2022-06-14", "display": "EOS - dns", "feature": "398c32e8-0038-4855-a121-95c198e37b77", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "config_type": "cli", "description": "", "last_updated": "2022-06-14T09:51:49.137799Z", "match_config": "ip domain\\r\\ndns domain", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
b792ed24-44d3-4a90-8190-6398c3afd5f2	2022-06-14 15:20:47.599346+00	admin	aa98951a-145a-4c0f-9ae0-f4e0c985984f	create	b5c3651d-aff2-4626-bf64-bbfa092aa12d	\N	gh-token	{"name": "gh-token", "slug": "gh-token", "tags": [], "created": "2022-06-14", "provider": "environment-variable", "parameters": {"variable": "GH_TOKEN"}, "description": "PK github", "last_updated": "2022-06-14T15:20:47.529Z", "custom_fields": {}}	93	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "b5c3651d-aff2-4626-bf64-bbfa092aa12d", "url": "/api/extras/secrets/b5c3651d-aff2-4626-bf64-bbfa092aa12d/", "name": "gh-token", "slug": "gh-token", "tags": [], "created": "2022-06-14", "display": "gh-token", "provider": "environment-variable", "parameters": {"variable": "GH_TOKEN"}, "description": "PK github", "last_updated": "2022-06-14T15:20:47.529836Z", "custom_fields": {}}
e3305793-908e-4d4e-8dfb-f6c37778dbd1	2022-06-14 15:21:15.656031+00	admin	91c73a2e-7a9f-409b-9be5-1e30c0ad55c9	create	4efbc58a-1757-47cc-b6d6-bdea3c1f3a14	\N	Github	{"name": "Github", "slug": "github", "created": "2022-06-14", "description": "", "last_updated": "2022-06-14T15:21:15.610Z", "custom_fields": {}}	94	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "4efbc58a-1757-47cc-b6d6-bdea3c1f3a14", "url": "/api/extras/secrets-groups/4efbc58a-1757-47cc-b6d6-bdea3c1f3a14/", "name": "Github", "slug": "github", "created": "2022-06-14", "display": "Github", "secrets": [], "description": "", "last_updated": "2022-06-14T15:21:15.610280Z", "custom_fields": {}}
983c8aa4-5b80-43c2-a481-d12b79f036d6	2022-06-14 15:22:15.982127+00	admin	7c6fd272-63be-4364-a19a-e5ca881351b4	create	3f5dabb2-61ef-4977-aaff-08fb7e7520fa	\N	gc-backup	{"name": "gc-backup", "slug": "gc-backup", "tags": [], "branch": "main", "created": "2022-06-14", "username": "", "remote_url": "https://github.com/pke11y/pknet_backup.git", "current_head": "", "last_updated": "2022-06-14T15:22:15.930Z", "custom_fields": {}, "secrets_group": "4efbc58a-1757-47cc-b6d6-bdea3c1f3a14", "provided_contents": ["nautobot_golden_config.backupconfigs"]}	75	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "3f5dabb2-61ef-4977-aaff-08fb7e7520fa", "url": "/api/extras/git-repositories/3f5dabb2-61ef-4977-aaff-08fb7e7520fa/", "name": "gc-backup", "slug": "gc-backup", "branch": "main", "created": "2022-06-14", "display": "gc-backup", "username": "", "remote_url": "https://github.com/pke11y/pknet_backup.git", "current_head": "", "last_updated": "2022-06-14T15:22:15.930816Z", "custom_fields": {}, "secrets_group": {"id": "4efbc58a-1757-47cc-b6d6-bdea3c1f3a14", "url": "/api/extras/secrets-groups/4efbc58a-1757-47cc-b6d6-bdea3c1f3a14/", "name": "Github", "slug": "github", "display": "Github"}, "provided_contents": ["nautobot_golden_config.backupconfigs"]}
6a2e6dd7-c6ae-418c-9798-90d7b9514e72	2022-06-14 15:22:56.560468+00	admin	c1a15961-70c8-49d0-9723-d3dea06242f3	create	54515f59-dcf1-419a-b0be-76474be05ebe	\N	gc-intended	{"name": "gc-intended", "slug": "gc-intended", "tags": [], "branch": "main", "created": "2022-06-14", "username": "", "remote_url": "https://github.com/pke11y/pknet_intended.git", "current_head": "", "last_updated": "2022-06-14T15:22:56.515Z", "custom_fields": {}, "secrets_group": "4efbc58a-1757-47cc-b6d6-bdea3c1f3a14", "provided_contents": ["nautobot_golden_config.intendedconfigs"]}	75	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "54515f59-dcf1-419a-b0be-76474be05ebe", "url": "/api/extras/git-repositories/54515f59-dcf1-419a-b0be-76474be05ebe/", "name": "gc-intended", "slug": "gc-intended", "branch": "main", "created": "2022-06-14", "display": "gc-intended", "username": "", "remote_url": "https://github.com/pke11y/pknet_intended.git", "current_head": "", "last_updated": "2022-06-14T15:22:56.515705Z", "custom_fields": {}, "secrets_group": {"id": "4efbc58a-1757-47cc-b6d6-bdea3c1f3a14", "url": "/api/extras/secrets-groups/4efbc58a-1757-47cc-b6d6-bdea3c1f3a14/", "name": "Github", "slug": "github", "display": "Github"}, "provided_contents": ["nautobot_golden_config.intendedconfigs"]}
d710c681-68fb-45a2-b88f-0d9990aea160	2022-06-14 15:24:56.979597+00	admin	161722a7-05fb-4283-9422-e72aad43ddcf	create	5d1a85f2-2c09-4c38-b691-ae7c78427efd	\N	router	{"name": "router", "slug": "router", "color": "ff5722", "created": "2022-06-14", "vm_role": false, "description": "", "last_updated": "2022-06-14T15:24:56.892Z", "custom_fields": {}}	43	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "url": "/api/dcim/device-roles/5d1a85f2-2c09-4c38-b691-ae7c78427efd/", "name": "router", "slug": "router", "color": "ff5722", "created": "2022-06-14", "display": "router", "vm_role": false, "description": "", "last_updated": "2022-06-14T15:24:56.892857Z", "custom_fields": {}}
7ae29a2d-7028-41fd-9c30-89985317168c	2022-06-14 15:25:12.981871+00	admin	49eb042d-e98b-4e88-bd39-bae4f5c44fff	create	06d9178b-b0f3-4918-a3a5-e633f4d7c269	\N	cEOS	{"slug": "ceos", "tags": [], "model": "cEOS", "created": "2022-06-14", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-14T15:25:12.926Z", "manufacturer": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "custom_fields": {}, "is_full_depth": true, "subdevice_role": ""}	44	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "url": "/api/dcim/device-types/06d9178b-b0f3-4918-a3a5-e633f4d7c269/", "slug": "ceos", "tags": [], "model": "cEOS", "created": "2022-06-14", "display": "Arista cEOS", "comments": "", "u_height": 1, "rear_image": null, "front_image": null, "part_number": "", "last_updated": "2022-06-14T15:25:12.926656Z", "manufacturer": {"id": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "url": "/api/dcim/manufacturers/dbb2897a-9ade-414f-97fb-cca1a92aaefb/", "name": "Arista", "slug": "arista", "display": "Arista"}, "custom_fields": {}, "is_full_depth": true, "subdevice_role": null}
9c6d3052-0233-4a27-ba19-62a501c30a94	2022-06-14 15:44:05.896004+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	4c86a884-1ba2-4cc8-ba61-013620a05080	\N	clab-basic-R3 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T15:44:05.883Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
13a5d582-7613-4047-b7e4-6b50528ccd85	2022-06-14 15:44:05.940312+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	a05a1a71-7227-448e-87bd-c927d2874f47	\N	clab-basic-R3 -> EOS - ipv6 -> False	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-14T15:44:05.930Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
521c83cc-1f67-4d0c-a04c-f0f9659c93a1	2022-06-14 15:44:05.941595+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	18309dfe-171e-4609-878a-ee9b1df4e340	\N	clab-basic-R1 -> EOS - ipv6 -> True	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T15:44:05.928Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
24b109fb-93b8-4fad-97f0-c55a2fcf620d	2022-06-14 15:26:07.52353+00	admin	bdbd80d6-eb71-4dbe-8fb3-e0552786bb1b	create	774633c5-8876-47c1-b9a7-0af0777d42c5	\N	clab-basic-R1	{"face": "", "name": "clab-basic-R1", "rack": null, "site": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "tags": [], "serial": "", "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "cluster": null, "created": "2022-06-14", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "device_type": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:26:07.432Z", "custom_fields": {}, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null, "local_context_data_owner_object_id": null, "local_context_data_owner_content_type": null}	1	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "774633c5-8876-47c1-b9a7-0af0777d42c5", "url": "/api/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/", "face": null, "name": "clab-basic-R1", "rack": null, "site": {"id": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "url": "/api/dcim/sites/0c1c9714-449d-4535-b366-8bac1f4c9a71/", "name": "Dublin", "slug": "dublin", "display": "Dublin"}, "tags": [], "serial": "", "status": {"label": "Active", "value": "active"}, "tenant": {"id": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "url": "/api/tenancy/tenants/97c019ba-0cfd-426f-9211-3ca7f6dd24d3/", "name": "HEC", "slug": "hec", "display": "HEC"}, "cluster": null, "created": "2022-06-14", "display": "clab-basic-R1", "comments": "", "platform": null, "position": null, "asset_tag": null, "primary_ip": null, "device_role": {"id": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "url": "/api/dcim/device-roles/5d1a85f2-2c09-4c38-b691-ae7c78427efd/", "name": "router", "slug": "router", "display": "router"}, "device_type": {"id": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "url": "/api/dcim/device-types/06d9178b-b0f3-4918-a3a5-e633f4d7c269/", "slug": "ceos", "model": "cEOS", "display": "Arista cEOS", "manufacturer": {"id": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "url": "/api/dcim/manufacturers/dbb2897a-9ade-414f-97fb-cca1a92aaefb/", "name": "Arista", "slug": "arista", "display": "Arista"}}, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:26:07.432926Z", "custom_fields": {}, "parent_device": null, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null}
9e69fbda-2edc-4f7e-8721-da33f49738ce	2022-06-14 15:26:25.428818+00	admin	50ed3e0a-5aae-4fe8-aa2a-cb9ff07337e9	create	06745599-bc34-41c5-af97-699accfc8ad6	\N	clab-basic-R2	{"face": "", "name": "clab-basic-R2", "rack": null, "site": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "tags": [], "serial": "", "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "cluster": null, "created": "2022-06-14", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "device_type": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:26:25.347Z", "custom_fields": {}, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null, "local_context_data_owner_object_id": null, "local_context_data_owner_content_type": null}	1	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "06745599-bc34-41c5-af97-699accfc8ad6", "url": "/api/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/", "face": null, "name": "clab-basic-R2", "rack": null, "site": {"id": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "url": "/api/dcim/sites/0c1c9714-449d-4535-b366-8bac1f4c9a71/", "name": "Dublin", "slug": "dublin", "display": "Dublin"}, "tags": [], "serial": "", "status": {"label": "Active", "value": "active"}, "tenant": {"id": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "url": "/api/tenancy/tenants/97c019ba-0cfd-426f-9211-3ca7f6dd24d3/", "name": "HEC", "slug": "hec", "display": "HEC"}, "cluster": null, "created": "2022-06-14", "display": "clab-basic-R2", "comments": "", "platform": null, "position": null, "asset_tag": null, "primary_ip": null, "device_role": {"id": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "url": "/api/dcim/device-roles/5d1a85f2-2c09-4c38-b691-ae7c78427efd/", "name": "router", "slug": "router", "display": "router"}, "device_type": {"id": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "url": "/api/dcim/device-types/06d9178b-b0f3-4918-a3a5-e633f4d7c269/", "slug": "ceos", "model": "cEOS", "display": "Arista cEOS", "manufacturer": {"id": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "url": "/api/dcim/manufacturers/dbb2897a-9ade-414f-97fb-cca1a92aaefb/", "name": "Arista", "slug": "arista", "display": "Arista"}}, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:26:25.347522Z", "custom_fields": {}, "parent_device": null, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null}
9e887d87-d24a-4c64-9b53-e392e79c0b68	2022-06-14 15:26:40.582352+00	admin	02e75210-b9e4-442b-8046-120cbddb9c76	create	81779b36-7a77-4055-b8e9-6eb98e50bff5	\N	clab-basic-R3	{"face": "", "name": "clab-basic-R3", "rack": null, "site": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "tags": [], "serial": "", "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": "d52e9447-b1b4-421b-a49f-a540fa6824e7", "cluster": null, "created": "2022-06-14", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "device_type": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:26:40.502Z", "custom_fields": {}, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null, "local_context_data_owner_object_id": null, "local_context_data_owner_content_type": null}	1	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "url": "/api/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/", "face": null, "name": "clab-basic-R3", "rack": null, "site": {"id": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "url": "/api/dcim/sites/0c1c9714-449d-4535-b366-8bac1f4c9a71/", "name": "Dublin", "slug": "dublin", "display": "Dublin"}, "tags": [], "serial": "", "status": {"label": "Active", "value": "active"}, "tenant": {"id": "d52e9447-b1b4-421b-a49f-a540fa6824e7", "url": "/api/tenancy/tenants/d52e9447-b1b4-421b-a49f-a540fa6824e7/", "name": "Converged Cloud", "slug": "converged-cloud", "display": "Converged Cloud"}, "cluster": null, "created": "2022-06-14", "display": "clab-basic-R3", "comments": "", "platform": null, "position": null, "asset_tag": null, "primary_ip": null, "device_role": {"id": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "url": "/api/dcim/device-roles/5d1a85f2-2c09-4c38-b691-ae7c78427efd/", "name": "router", "slug": "router", "display": "router"}, "device_type": {"id": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "url": "/api/dcim/device-types/06d9178b-b0f3-4918-a3a5-e633f4d7c269/", "slug": "ceos", "model": "cEOS", "display": "Arista cEOS", "manufacturer": {"id": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "url": "/api/dcim/manufacturers/dbb2897a-9ade-414f-97fb-cca1a92aaefb/", "name": "Arista", "slug": "arista", "display": "Arista"}}, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:26:40.502469Z", "custom_fields": {}, "parent_device": null, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null}
086b4863-3397-45e7-8381-0c3fce537f69	2022-06-14 15:27:04.601666+00	admin	d049c632-1741-4b49-99c7-99c5b39f0e8f	update	f803b794-1e57-4b23-8dfc-8cf5404a7d6c	\N	Execute All Golden Configuration Jobs - Multiple Device	{"name": "Execute All Golden Configuration Jobs - Multiple Device", "slug": "plugins-nautobot_golden_config-jobs-alldevicesgoldenconfig", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-14", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0, "description": "Process to run all Golden Configuration jobs configured against multiple devices.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-14T15:27:04.547Z", "custom_fields": {}, "name_override": false, "commit_default": true, "git_repository": null, "job_class_name": "AllDevicesGoldenConfig", "hidden_override": false, "soft_time_limit": 0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}	12	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "f803b794-1e57-4b23-8dfc-8cf5404a7d6c", "url": "/api/extras/jobs/f803b794-1e57-4b23-8dfc-8cf5404a7d6c/", "name": "Execute All Golden Configuration Jobs - Multiple Device", "slug": "plugins-nautobot_golden_config-jobs-alldevicesgoldenconfig", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-14", "display": "Execute All Golden Configuration Jobs - Multiple Device", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0.0, "description": "Process to run all Golden Configuration jobs configured against multiple devices.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-14T15:27:04.547946Z", "custom_fields": {}, "name_override": false, "commit_default": true, "job_class_name": "AllDevicesGoldenConfig", "hidden_override": false, "soft_time_limit": 0.0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}
50fd47cd-6e7c-4b7a-92b0-d05087e05ae3	2022-06-14 15:44:05.900191+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	ce208f90-56ca-44e4-933b-49dd800c81ff	\N	clab-basic-R1 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T15:44:05.882Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9ded6553-4c8d-4a92-88e5-c63d68bd5caa	2022-06-14 15:27:12.156254+00	admin	addd380f-65d3-4168-b1b2-e01176e5d200	update	8e39dcf4-dab5-4097-8c37-0fe64030b459	\N	Execute All Golden Configuration Jobs - Single Device	{"name": "Execute All Golden Configuration Jobs - Single Device", "slug": "plugins-nautobot_golden_config-jobs-allgoldenconfig", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-14", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0, "description": "Process to run all Golden Configuration jobs configured.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-14T15:27:12.080Z", "custom_fields": {}, "name_override": false, "commit_default": true, "git_repository": null, "job_class_name": "AllGoldenConfig", "hidden_override": false, "soft_time_limit": 0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}	12	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "8e39dcf4-dab5-4097-8c37-0fe64030b459", "url": "/api/extras/jobs/8e39dcf4-dab5-4097-8c37-0fe64030b459/", "name": "Execute All Golden Configuration Jobs - Single Device", "slug": "plugins-nautobot_golden_config-jobs-allgoldenconfig", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-14", "display": "Execute All Golden Configuration Jobs - Single Device", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0.0, "description": "Process to run all Golden Configuration jobs configured.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-14T15:27:12.080532Z", "custom_fields": {}, "name_override": false, "commit_default": true, "job_class_name": "AllGoldenConfig", "hidden_override": false, "soft_time_limit": 0.0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}
4e5a1174-8631-4606-8d11-a82c7c01f0fd	2022-06-14 15:27:21.050291+00	admin	c1e1f611-ef82-43f2-9f2a-9ba7f52219b2	update	1b919031-52b6-4030-a519-a919d1049be5	\N	Perform Configuration Compliance	{"name": "Perform Configuration Compliance", "slug": "plugins-nautobot_golden_config-jobs-compliancejob", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-14", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0, "description": "Run configuration compliance on your network infrastructure.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-14T15:27:20.990Z", "custom_fields": {}, "name_override": false, "commit_default": true, "git_repository": null, "job_class_name": "ComplianceJob", "hidden_override": false, "soft_time_limit": 0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}	12	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "1b919031-52b6-4030-a519-a919d1049be5", "url": "/api/extras/jobs/1b919031-52b6-4030-a519-a919d1049be5/", "name": "Perform Configuration Compliance", "slug": "plugins-nautobot_golden_config-jobs-compliancejob", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-14", "display": "Perform Configuration Compliance", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0.0, "description": "Run configuration compliance on your network infrastructure.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-14T15:27:20.990564Z", "custom_fields": {}, "name_override": false, "commit_default": true, "job_class_name": "ComplianceJob", "hidden_override": false, "soft_time_limit": 0.0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}
e377fb1b-b4af-4868-8dbd-4143ac78229c	2022-06-14 15:34:15.898362+00	admin	78c8a5e1-7c14-4fec-a753-3c5b97fed8df	create	fba0a09d-658c-4329-bb4e-b5c25fd6946e	\N	compliance rule exclusion	{"name": "compliance rule exclusion", "slug": "compliance-rule-exclusion", "type": "many-to-many", "created": "2022-06-14", "advanced_ui": false, "description": "", "source_type": 111, "last_updated": "2022-06-14T15:34:15.871Z", "source_label": "Tenant", "source_filter": null, "source_hidden": false, "destination_type": 99, "destination_label": "Compliance Rule Exclusion", "destination_filter": null, "destination_hidden": false}	78	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "fba0a09d-658c-4329-bb4e-b5c25fd6946e", "url": "/api/extras/relationships/fba0a09d-658c-4329-bb4e-b5c25fd6946e/", "name": "compliance rule exclusion", "slug": "compliance-rule-exclusion", "type": "many-to-many", "description": "", "source_type": "nautobot_golden_config.compliancerule", "source_label": "Tenant", "source_filter": null, "source_hidden": false, "destination_type": "tenancy.tenant", "destination_label": "Compliance Rule Exclusion", "destination_filter": null, "destination_hidden": false}
d4cfe341-f36d-4c2f-a9e6-0284963165f2	2022-06-14 15:38:59.409342+00	admin	106608b8-460b-4267-9655-6522302aaca3	update	fba0a09d-658c-4329-bb4e-b5c25fd6946e	\N	compliance rule exclusion	{"name": "compliance rule exclusion", "slug": "compliance-rule-exclusion", "type": "many-to-many", "created": "2022-06-14", "advanced_ui": false, "description": "", "source_type": 116, "last_updated": "2022-06-14T15:38:59.392Z", "source_label": "Tenant", "source_filter": null, "source_hidden": false, "destination_type": 99, "destination_label": "Compliance Rule Exclusion", "destination_filter": null, "destination_hidden": false}	78	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "fba0a09d-658c-4329-bb4e-b5c25fd6946e", "url": "/api/extras/relationships/fba0a09d-658c-4329-bb4e-b5c25fd6946e/", "name": "compliance rule exclusion", "slug": "compliance-rule-exclusion", "type": "many-to-many", "description": "", "source_type": "nautobot_golden_config.configcompliance", "source_label": "Tenant", "source_filter": null, "source_hidden": false, "destination_type": "tenancy.tenant", "destination_label": "Compliance Rule Exclusion", "destination_filter": null, "destination_hidden": false}
c0186c86-5824-4df7-a4c4-908d2becc73c	2022-06-14 15:43:39.458094+00	admin	98a6ace0-8859-478f-875c-345a3a2e8a9a	update	774633c5-8876-47c1-b9a7-0af0777d42c5	\N	clab-basic-R1	{"face": "", "name": "clab-basic-R1", "rack": null, "site": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "tags": [], "serial": "", "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "cluster": null, "created": "2022-06-14", "comments": "", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "position": null, "asset_tag": null, "device_role": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "device_type": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:43:39.369Z", "custom_fields": {}, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null, "local_context_data_owner_object_id": null, "local_context_data_owner_content_type": null}	1	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "774633c5-8876-47c1-b9a7-0af0777d42c5", "url": "/api/dcim/devices/774633c5-8876-47c1-b9a7-0af0777d42c5/", "face": null, "name": "clab-basic-R1", "rack": null, "site": {"id": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "url": "/api/dcim/sites/0c1c9714-449d-4535-b366-8bac1f4c9a71/", "name": "Dublin", "slug": "dublin", "display": "Dublin"}, "tags": [], "serial": "", "status": {"label": "Active", "value": "active"}, "tenant": {"id": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "url": "/api/tenancy/tenants/97c019ba-0cfd-426f-9211-3ca7f6dd24d3/", "name": "HEC", "slug": "hec", "display": "HEC"}, "cluster": null, "created": "2022-06-14", "display": "clab-basic-R1", "comments": "", "platform": {"id": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "url": "/api/dcim/platforms/75bcfef4-6eb4-44a5-bc8e-558e70e44978/", "name": "EOS", "slug": "arista_eos", "display": "EOS"}, "position": null, "asset_tag": null, "primary_ip": null, "device_role": {"id": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "url": "/api/dcim/device-roles/5d1a85f2-2c09-4c38-b691-ae7c78427efd/", "name": "router", "slug": "router", "display": "router"}, "device_type": {"id": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "url": "/api/dcim/device-types/06d9178b-b0f3-4918-a3a5-e633f4d7c269/", "slug": "ceos", "model": "cEOS", "display": "Arista cEOS", "manufacturer": {"id": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "url": "/api/dcim/manufacturers/dbb2897a-9ade-414f-97fb-cca1a92aaefb/", "name": "Arista", "slug": "arista", "display": "Arista"}}, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:43:39.369309Z", "custom_fields": {}, "parent_device": null, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null}
15df6b6b-5f13-4946-9044-73e34611d09e	2022-06-14 15:44:05.910143+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	4708cd46-b51b-4194-b4b3-f2216dcaba63	\N	clab-basic-R2 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T15:44:05.897Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1afa4919-0303-4917-b8fa-1e7e90a72886	2022-06-14 15:43:39.673057+00	admin	98a6ace0-8859-478f-875c-345a3a2e8a9a	update	06745599-bc34-41c5-af97-699accfc8ad6	\N	clab-basic-R2	{"face": "", "name": "clab-basic-R2", "rack": null, "site": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "tags": [], "serial": "", "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "cluster": null, "created": "2022-06-14", "comments": "", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "position": null, "asset_tag": null, "device_role": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "device_type": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:43:39.596Z", "custom_fields": {}, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null, "local_context_data_owner_object_id": null, "local_context_data_owner_content_type": null}	1	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "06745599-bc34-41c5-af97-699accfc8ad6", "url": "/api/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/", "face": null, "name": "clab-basic-R2", "rack": null, "site": {"id": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "url": "/api/dcim/sites/0c1c9714-449d-4535-b366-8bac1f4c9a71/", "name": "Dublin", "slug": "dublin", "display": "Dublin"}, "tags": [], "serial": "", "status": {"label": "Active", "value": "active"}, "tenant": {"id": "97c019ba-0cfd-426f-9211-3ca7f6dd24d3", "url": "/api/tenancy/tenants/97c019ba-0cfd-426f-9211-3ca7f6dd24d3/", "name": "HEC", "slug": "hec", "display": "HEC"}, "cluster": null, "created": "2022-06-14", "display": "clab-basic-R2", "comments": "", "platform": {"id": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "url": "/api/dcim/platforms/75bcfef4-6eb4-44a5-bc8e-558e70e44978/", "name": "EOS", "slug": "arista_eos", "display": "EOS"}, "position": null, "asset_tag": null, "primary_ip": null, "device_role": {"id": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "url": "/api/dcim/device-roles/5d1a85f2-2c09-4c38-b691-ae7c78427efd/", "name": "router", "slug": "router", "display": "router"}, "device_type": {"id": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "url": "/api/dcim/device-types/06d9178b-b0f3-4918-a3a5-e633f4d7c269/", "slug": "ceos", "model": "cEOS", "display": "Arista cEOS", "manufacturer": {"id": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "url": "/api/dcim/manufacturers/dbb2897a-9ade-414f-97fb-cca1a92aaefb/", "name": "Arista", "slug": "arista", "display": "Arista"}}, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:43:39.596041Z", "custom_fields": {}, "parent_device": null, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null}
e8e26247-d5a4-4453-92d4-c2d66868b151	2022-06-14 15:43:39.857249+00	admin	98a6ace0-8859-478f-875c-345a3a2e8a9a	update	81779b36-7a77-4055-b8e9-6eb98e50bff5	\N	clab-basic-R3	{"face": "", "name": "clab-basic-R3", "rack": null, "site": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "tags": [], "serial": "", "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": "d52e9447-b1b4-421b-a49f-a540fa6824e7", "cluster": null, "created": "2022-06-14", "comments": "", "platform": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "position": null, "asset_tag": null, "device_role": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "device_type": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:43:39.787Z", "custom_fields": {}, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null, "local_context_data_owner_object_id": null, "local_context_data_owner_content_type": null}	1	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "url": "/api/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/", "face": null, "name": "clab-basic-R3", "rack": null, "site": {"id": "0c1c9714-449d-4535-b366-8bac1f4c9a71", "url": "/api/dcim/sites/0c1c9714-449d-4535-b366-8bac1f4c9a71/", "name": "Dublin", "slug": "dublin", "display": "Dublin"}, "tags": [], "serial": "", "status": {"label": "Active", "value": "active"}, "tenant": {"id": "d52e9447-b1b4-421b-a49f-a540fa6824e7", "url": "/api/tenancy/tenants/d52e9447-b1b4-421b-a49f-a540fa6824e7/", "name": "Converged Cloud", "slug": "converged-cloud", "display": "Converged Cloud"}, "cluster": null, "created": "2022-06-14", "display": "clab-basic-R3", "comments": "", "platform": {"id": "75bcfef4-6eb4-44a5-bc8e-558e70e44978", "url": "/api/dcim/platforms/75bcfef4-6eb4-44a5-bc8e-558e70e44978/", "name": "EOS", "slug": "arista_eos", "display": "EOS"}, "position": null, "asset_tag": null, "primary_ip": null, "device_role": {"id": "5d1a85f2-2c09-4c38-b691-ae7c78427efd", "url": "/api/dcim/device-roles/5d1a85f2-2c09-4c38-b691-ae7c78427efd/", "name": "router", "slug": "router", "display": "router"}, "device_type": {"id": "06d9178b-b0f3-4918-a3a5-e633f4d7c269", "url": "/api/dcim/device-types/06d9178b-b0f3-4918-a3a5-e633f4d7c269/", "slug": "ceos", "model": "cEOS", "display": "Arista cEOS", "manufacturer": {"id": "dbb2897a-9ade-414f-97fb-cca1a92aaefb", "url": "/api/dcim/manufacturers/dbb2897a-9ade-414f-97fb-cca1a92aaefb/", "name": "Arista", "slug": "arista", "display": "Arista"}}, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-14T15:43:39.787014Z", "custom_fields": {}, "parent_device": null, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null}
0602b9e3-9379-4520-a4d6-a2c0c6632dad	2022-06-14 15:44:05.702377+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.651Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": null, "compliance_last_success_date": null}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
803bc197-e833-4a54-90db-f955d8cf85e2	2022-06-14 15:44:05.704524+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.658Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": null, "compliance_last_success_date": null}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f6c4979e-bf91-4d28-aa37-7caf0f67a69a	2022-06-14 15:44:05.7085+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.633Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": null, "compliance_last_success_date": null}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9ae0020a-b357-4dc1-a7e7-31ada501f8e9	2022-06-14 15:44:05.778825+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.752Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T15:44:04.174", "compliance_last_success_date": null}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
473853b9-26a8-43b1-8abe-085182ddcbc4	2022-06-14 15:44:05.780482+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.755Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T15:44:04.174", "compliance_last_success_date": null}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a47e64a4-5d98-4a9b-aa43-384e8a7bd030	2022-06-14 15:44:05.784594+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.757Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T15:44:04.174", "compliance_last_success_date": null}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3efcc227-bfcb-4f13-95c9-9ee10a425eac	2022-06-14 15:44:05.854714+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	e10e3701-2dcf-4de9-b41e-fc149c107b91	\N	clab-basic-R2 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T15:44:05.839Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6400ff47-3d98-4b51-9e06-467f500963b9	2022-06-14 15:44:05.855769+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	7465b2c8-d30c-48ad-871a-a0d0481836ab	\N	clab-basic-R1 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T15:44:05.845Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b46a448c-5533-4fd6-a337-67fc833c945a	2022-06-14 15:44:05.95159+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	create	bb5b9a26-8921-4f2b-bc84-5ef39d06a9fd	\N	clab-basic-R2 -> EOS - ipv6 -> True	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T15:44:05.942Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ab772cd9-7561-471b-aeb5-30b7e24fc16d	2022-06-14 15:44:06.022454+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.996Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T15:44:04.174", "compliance_last_success_date": "2022-06-14T15:44:04.174"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
daf654c2-23a3-458d-8507-7ed91378e945	2022-06-14 15:44:05.981395+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.968Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T15:44:04.174", "compliance_last_success_date": "2022-06-14T15:44:04.174"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
88004891-43e7-472b-8ff7-b6e686dcd50a	2022-06-14 15:44:05.995655+00	admin	5366e7f6-e40d-4f14-8a51-219d1fb72a91	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T15:44:05.973Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T15:44:04.174", "compliance_last_success_date": "2022-06-14T15:44:04.174"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b6a6fb53-aa29-4232-bc35-190198bcbdc0	2022-06-14 20:40:20.105613+00	admin	0da88fd9-2ab5-41ec-a779-27a1687d15ac	update	fba0a09d-658c-4329-bb4e-b5c25fd6946e	\N	compliance rule exclusion	{"name": "compliance rule exclusion", "slug": "compliance-rule-exclusion", "type": "many-to-many", "created": "2022-06-14", "advanced_ui": false, "description": "", "source_type": 111, "last_updated": "2022-06-14T20:40:20.065Z", "source_label": "Tenant", "source_filter": null, "source_hidden": false, "destination_type": 99, "destination_label": "Compliance Rule Exclusion", "destination_filter": null, "destination_hidden": false}	78	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "fba0a09d-658c-4329-bb4e-b5c25fd6946e", "url": "/api/extras/relationships/fba0a09d-658c-4329-bb4e-b5c25fd6946e/", "name": "compliance rule exclusion", "slug": "compliance-rule-exclusion", "type": "many-to-many", "description": "", "source_type": "nautobot_golden_config.compliancerule", "source_label": "Tenant", "source_filter": null, "source_hidden": false, "destination_type": "tenancy.tenant", "destination_label": "Compliance Rule Exclusion", "destination_filter": null, "destination_hidden": false}
160bb044-03eb-44e9-ae95-f6a2cb021fac	2022-06-14 20:41:41.13105+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T20:41:41.060Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:41:39.849", "compliance_last_success_date": "2022-06-14T15:44:04.174Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9374ab0e-2920-45e3-9f10-7e0d8757eff8	2022-06-14 20:41:41.135323+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T20:41:41.022Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:41:39.849", "compliance_last_success_date": "2022-06-14T15:44:04.174Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
84036845-19ad-4789-aa5e-8eca428fb682	2022-06-14 20:41:41.149913+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T20:41:41.062Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:41:39.849", "compliance_last_success_date": "2022-06-14T15:44:04.174Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8f473251-13d0-435f-a74d-590f2d64f09a	2022-06-14 20:41:41.253762+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	7465b2c8-d30c-48ad-871a-a0d0481836ab	\N	clab-basic-R1 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:41:41.214Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5cd73b32-8ac3-465b-9c31-8acf31b6deb1	2022-06-14 20:41:41.260992+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	e10e3701-2dcf-4de9-b41e-fc149c107b91	\N	clab-basic-R2 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:41:41.223Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
06de5dd1-b3ba-4f17-b463-0d16d2afbc09	2022-06-14 20:41:41.270735+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	7e362657-11a6-44df-ba6a-d11dfa95eabf	\N	clab-basic-R3 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:41:41.235Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1aa51abe-9f2a-4cc1-bb39-75545d9e019b	2022-06-14 20:41:41.318592+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	ce208f90-56ca-44e4-933b-49dd800c81ff	\N	clab-basic-R1 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:41:41.301Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a21b35fc-a684-41c2-a4f4-3529ee856e06	2022-06-14 20:41:41.339536+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	4708cd46-b51b-4194-b4b3-f2216dcaba63	\N	clab-basic-R2 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:41:41.317Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2997597e-cdd8-4812-bf75-d484d0410cce	2022-06-14 20:41:41.34149+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	4c86a884-1ba2-4cc8-ba61-013620a05080	\N	clab-basic-R3 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:41:41.322Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6b175c37-14a4-49e5-a22b-07b2c3bc04e8	2022-06-14 20:41:41.400283+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	18309dfe-171e-4609-878a-ee9b1df4e340	\N	clab-basic-R1 -> EOS - ipv6 -> True	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:41:41.381Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
869d4431-2add-4d22-b527-939060af767a	2022-06-14 20:41:41.407643+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	a05a1a71-7227-448e-87bd-c927d2874f47	\N	clab-basic-R3 -> EOS - ipv6 -> False	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-14T20:41:41.392Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8a3fb7cb-fc2b-4035-92d4-b05fceed1a00	2022-06-14 20:41:41.41412+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	bb5b9a26-8921-4f2b-bc84-5ef39d06a9fd	\N	clab-basic-R2 -> EOS - ipv6 -> True	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:41:41.398Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
cc95e3a9-ae03-4fdf-afab-b7593bdf2574	2022-06-14 20:41:41.438092+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T20:41:41.425Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:41:39.849", "compliance_last_success_date": "2022-06-14T20:41:39.849"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9d70915d-3bf0-402e-b6bd-be1792424524	2022-06-14 20:41:41.439513+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T20:41:41.426Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:41:39.849", "compliance_last_success_date": "2022-06-14T20:41:39.849"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
194cafe8-10c0-4ed7-a947-cd2fda387390	2022-06-14 20:41:41.446262+00	admin	bd309146-9c15-437b-81c3-2dcfac066293	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T20:41:41.432Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:41:39.849", "compliance_last_success_date": "2022-06-14T20:41:39.849"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5089c77b-449f-41d3-b0d7-362c5044d328	2022-06-14 20:42:28.112851+00	admin	bb2da928-c7fa-449f-8e2c-b82c066967fa	update	d52e9447-b1b4-421b-a49f-a540fa6824e7	\N	Converged Cloud	{"name": "Converged Cloud", "slug": "converged-cloud", "tags": [], "group": null, "created": "2022-06-14", "comments": "", "description": "", "last_updated": "2022-06-14T20:42:27.904Z", "custom_fields": {}}	99	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "d52e9447-b1b4-421b-a49f-a540fa6824e7", "url": "/api/tenancy/tenants/d52e9447-b1b4-421b-a49f-a540fa6824e7/", "name": "Converged Cloud", "slug": "converged-cloud", "tags": [], "group": null, "created": "2022-06-14", "display": "Converged Cloud", "comments": "", "description": "", "last_updated": "2022-06-14T20:42:27.904348Z", "custom_fields": {}}
fe0c768b-7b94-4617-bf55-a520451e6f2b	2022-06-14 20:42:48.586332+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T20:42:48.568Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:42:48.201", "compliance_last_success_date": "2022-06-14T20:41:39.849Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7d6ed831-36d1-49f3-b8ba-184eba61bab7	2022-06-14 20:42:48.593639+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T20:42:48.560Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:42:48.201", "compliance_last_success_date": "2022-06-14T20:41:39.849Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5694122d-87a8-4e84-bf7c-ef3011dd56b8	2022-06-14 20:42:48.603097+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T20:42:48.573Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:42:48.201", "compliance_last_success_date": "2022-06-14T20:41:39.849Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9fcf73df-8ec7-42ab-bceb-5a94d514ffbb	2022-06-14 20:42:48.683084+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	7e362657-11a6-44df-ba6a-d11dfa95eabf	\N	clab-basic-R3 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:42:48.651Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
59d47597-1697-4bb5-a977-5f10503af75b	2022-06-14 20:42:48.686665+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	7465b2c8-d30c-48ad-871a-a0d0481836ab	\N	clab-basic-R1 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:42:48.649Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
04775ddb-4aa0-4b63-b0d2-5fef78a62847	2022-06-14 20:42:48.706651+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	e10e3701-2dcf-4de9-b41e-fc149c107b91	\N	clab-basic-R2 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:42:48.674Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5e6ed7c1-893e-4452-9586-2657dcd1c693	2022-06-14 20:42:48.773353+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	ce208f90-56ca-44e4-933b-49dd800c81ff	\N	clab-basic-R1 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:42:48.745Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c07eed56-f1c9-47c4-a21b-216abceb6cfb	2022-06-14 20:42:48.775807+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	4c86a884-1ba2-4cc8-ba61-013620a05080	\N	clab-basic-R3 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:42:48.737Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b730f1a0-5ed9-4e39-a1a2-f3245f423985	2022-06-14 20:42:48.78531+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	4708cd46-b51b-4194-b4b3-f2216dcaba63	\N	clab-basic-R2 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:42:48.763Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
611c55ef-d01e-4a01-9835-935b7c04e7a4	2022-06-14 20:42:48.849252+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	18309dfe-171e-4609-878a-ee9b1df4e340	\N	clab-basic-R1 -> EOS - ipv6 -> True	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:42:48.826Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f70c5f2d-9580-4a46-8a7c-ad6b28e78848	2022-06-14 20:42:48.855099+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	a05a1a71-7227-448e-87bd-c927d2874f47	\N	clab-basic-R3 -> EOS - ipv6 -> False	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-14T20:42:48.838Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8b55cb80-43a0-44b1-8f06-d1dd9b2dbb25	2022-06-14 20:42:48.85943+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	bb5b9a26-8921-4f2b-bc84-5ef39d06a9fd	\N	clab-basic-R2 -> EOS - ipv6 -> True	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:42:48.839Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a235a553-a0e9-405b-9680-5a7d949b425a	2022-06-14 20:42:48.891609+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T20:42:48.876Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:42:48.201", "compliance_last_success_date": "2022-06-14T20:42:48.201"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
679722c9-ae9d-40f6-b0dd-56de1c636f49	2022-06-14 20:42:48.899928+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T20:42:48.880Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:42:48.201", "compliance_last_success_date": "2022-06-14T20:42:48.201"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
867538a0-7b7f-4121-8690-196a4b8855c9	2022-06-14 20:42:48.908611+00	admin	8e9ed3ff-2bde-4871-97db-31f59e4ba69d	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T20:42:48.895Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:42:48.201", "compliance_last_success_date": "2022-06-14T20:42:48.201"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
15c1de19-8b28-4c93-b0ef-eaf0b40ecd2d	2022-06-14 20:53:17.546842+00	admin	f1b2b3d5-2f6f-4777-95ad-ec2aae10148f	update	fba0a09d-658c-4329-bb4e-b5c25fd6946e	\N	compliance rule exclusion	{"name": "compliance rule exclusion", "slug": "compliance_rule_exclusion", "type": "many-to-many", "created": "2022-06-14", "advanced_ui": false, "description": "", "source_type": 111, "last_updated": "2022-06-14T20:53:17.535Z", "source_label": "Tenant", "source_filter": null, "source_hidden": false, "destination_type": 99, "destination_label": "Compliance Rule Exclusion", "destination_filter": null, "destination_hidden": false}	78	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "fba0a09d-658c-4329-bb4e-b5c25fd6946e", "url": "/api/extras/relationships/fba0a09d-658c-4329-bb4e-b5c25fd6946e/", "name": "compliance rule exclusion", "slug": "compliance_rule_exclusion", "type": "many-to-many", "description": "", "source_type": "nautobot_golden_config.compliancerule", "source_label": "Tenant", "source_filter": null, "source_hidden": false, "destination_type": "tenancy.tenant", "destination_label": "Compliance Rule Exclusion", "destination_filter": null, "destination_hidden": false}
c801e99f-6385-4d6d-b6fb-961299d5050e	2022-06-14 20:53:45.446407+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T20:53:45.435Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:53:45.132", "compliance_last_success_date": "2022-06-14T20:42:48.201Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
983702fa-097a-452b-870a-87cd4a3dbd4b	2022-06-14 20:53:45.456027+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T20:53:45.421Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:53:45.132", "compliance_last_success_date": "2022-06-14T20:42:48.201Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
58ce0f22-5129-41b4-b81c-1161b6067209	2022-06-14 20:53:45.46407+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T20:53:45.434Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:53:45.132", "compliance_last_success_date": "2022-06-14T20:42:48.201Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ffccc4d0-0f83-40c5-8393-0b25bcb6529a	2022-06-14 20:53:45.55108+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	7e362657-11a6-44df-ba6a-d11dfa95eabf	\N	clab-basic-R3 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:53:45.519Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8c0c4a9d-02da-47cd-beb6-24ddbcbe4e1f	2022-06-14 20:53:45.554019+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	7465b2c8-d30c-48ad-871a-a0d0481836ab	\N	clab-basic-R1 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:53:45.521Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9e740ea8-eea9-4068-b45e-40e4b849e641	2022-06-14 20:53:45.554941+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	e10e3701-2dcf-4de9-b41e-fc149c107b91	\N	clab-basic-R2 -> EOS - aaa -> True	{"rule": "f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:53:45.511Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3b0e2a64-4ef1-4804-85c5-9db7505854a5	2022-06-14 20:53:45.602178+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	4c86a884-1ba2-4cc8-ba61-013620a05080	\N	clab-basic-R3 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:53:45.584Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
62302f26-2fa1-4f5c-8349-9e9d9301ee69	2022-06-14 20:53:45.608279+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	ce208f90-56ca-44e4-933b-49dd800c81ff	\N	clab-basic-R1 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:53:45.592Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
eaee12d3-f322-47b4-98ff-0d5161c6b602	2022-06-14 20:53:45.632348+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	4708cd46-b51b-4194-b4b3-f2216dcaba63	\N	clab-basic-R2 -> EOS - dns -> True	{"rule": "8adf858e-c6b7-43b0-95c3-ba5a2cebf852", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:53:45.608Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3f077898-e410-47a1-9538-10b50a296aad	2022-06-14 20:53:45.667322+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	a05a1a71-7227-448e-87bd-c927d2874f47	\N	clab-basic-R3 -> EOS - ipv6 -> False	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-14T20:53:45.652Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
da129456-6a14-4a90-869f-c74265e2860d	2022-06-14 20:53:45.671271+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	18309dfe-171e-4609-878a-ee9b1df4e340	\N	clab-basic-R1 -> EOS - ipv6 -> True	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:53:45.649Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e43a54fc-1b5b-4766-98de-0904c7182e10	2022-06-14 20:53:45.689218+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	bb5b9a26-8921-4f2b-bc84-5ef39d06a9fd	\N	clab-basic-R2 -> EOS - ipv6 -> True	{"rule": "80bfb542-c7ff-4db8-a38d-2435def2a7b9", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-14T20:53:45.677Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
28928b45-29b9-46fc-a4d9-519ff56f4c89	2022-06-14 20:53:45.701167+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-14T20:53:45.693Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:53:45.132", "compliance_last_success_date": "2022-06-14T20:53:45.132"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1614a360-39f7-4b0b-b4df-221452d4196c	2022-06-14 20:53:45.705514+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-14T20:53:45.695Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:53:45.132", "compliance_last_success_date": "2022-06-14T20:53:45.132"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c4d3687e-abcf-46a0-b557-25311629f29a	2022-06-14 20:53:45.723641+00	admin	9ef99ff4-e812-4b76-b055-cdf8fc77e7c1	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-14T20:53:45.716Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-14T20:53:45.132", "compliance_last_success_date": "2022-06-14T20:53:45.132"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
65c6dcea-d9f3-474d-bd26-8f491fccbd87	2022-06-29 09:19:01.798715+00	admin	f8261f22-37fd-447a-b451-db00a900a4ad	create	cf8f188f-27fd-4294-9afd-5c13bbaa2c90	\N	Arista	{"name": "Arista", "slug": "arista", "created": "2022-06-29", "description": "", "last_updated": "2022-06-29T09:19:01.676Z", "custom_fields": {}}	50	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "cf8f188f-27fd-4294-9afd-5c13bbaa2c90", "url": "/api/dcim/manufacturers/cf8f188f-27fd-4294-9afd-5c13bbaa2c90/", "name": "Arista", "slug": "arista", "created": "2022-06-29", "display": "Arista", "description": "", "last_updated": "2022-06-29T09:19:01.676417Z", "custom_fields": {}}
4af70dcc-06f8-45ba-ad17-838b7def842c	2022-06-29 09:19:29.81795+00	admin	e1e1ac9e-818c-4405-a851-f2ebdee3b502	create	50e0618d-c01a-464d-bb31-002e3c39d0ed	\N	Arista EOS	{"name": "Arista EOS", "slug": "arista_eos", "created": "2022-06-29", "description": "", "napalm_args": null, "last_updated": "2022-06-29T09:19:29.788Z", "manufacturer": "cf8f188f-27fd-4294-9afd-5c13bbaa2c90", "custom_fields": {}, "napalm_driver": ""}	51	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "url": "/api/dcim/platforms/50e0618d-c01a-464d-bb31-002e3c39d0ed/", "name": "Arista EOS", "slug": "arista_eos", "created": "2022-06-29", "display": "Arista EOS", "description": "", "napalm_args": null, "last_updated": "2022-06-29T09:19:29.788744Z", "manufacturer": {"id": "cf8f188f-27fd-4294-9afd-5c13bbaa2c90", "url": "/api/dcim/manufacturers/cf8f188f-27fd-4294-9afd-5c13bbaa2c90/", "name": "Arista", "slug": "arista", "display": "Arista"}, "custom_fields": {}, "napalm_driver": ""}
eb3cace3-e384-45da-a4c4-09fa59644d22	2022-06-29 09:19:45.258097+00	admin	3840b52e-5b54-4ac1-a64b-54246e8c0596	create	5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd	\N	router	{"name": "router", "slug": "router", "color": "795548", "created": "2022-06-29", "vm_role": false, "description": "", "last_updated": "2022-06-29T09:19:45.227Z", "custom_fields": {}}	43	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd", "url": "/api/dcim/device-roles/5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd/", "name": "router", "slug": "router", "color": "795548", "created": "2022-06-29", "display": "router", "vm_role": false, "description": "", "last_updated": "2022-06-29T09:19:45.227970Z", "custom_fields": {}}
84fb98f5-aeb9-49fd-bf7a-b3011771ca4a	2022-06-29 09:20:08.980071+00	admin	38689866-336f-4af8-b797-dda44507aa8c	create	941361f1-bd19-47f8-901a-fba1db0a477e	\N	cEOS	{"slug": "ceos", "tags": [], "model": "cEOS", "created": "2022-06-29", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-29T09:20:08.932Z", "manufacturer": "cf8f188f-27fd-4294-9afd-5c13bbaa2c90", "custom_fields": {}, "is_full_depth": true, "subdevice_role": ""}	44	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "941361f1-bd19-47f8-901a-fba1db0a477e", "url": "/api/dcim/device-types/941361f1-bd19-47f8-901a-fba1db0a477e/", "slug": "ceos", "tags": [], "model": "cEOS", "created": "2022-06-29", "display": "Arista cEOS", "comments": "", "u_height": 1, "rear_image": null, "front_image": null, "part_number": "", "last_updated": "2022-06-29T09:20:08.932212Z", "manufacturer": {"id": "cf8f188f-27fd-4294-9afd-5c13bbaa2c90", "url": "/api/dcim/manufacturers/cf8f188f-27fd-4294-9afd-5c13bbaa2c90/", "name": "Arista", "slug": "arista", "display": "Arista"}, "custom_fields": {}, "is_full_depth": true, "subdevice_role": null}
362ac51f-0c77-4f2a-af5b-dcfae509b40f	2022-06-29 09:21:07.565279+00	admin	351ba8d1-f628-4512-b8ac-3e758c0ffbaa	create	0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd	\N	Dublin	{"asn": null, "name": "Dublin", "slug": "dublin", "tags": [], "region": null, "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": null, "created": "2022-06-29", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": "", "description": "", "contact_name": "", "last_updated": "2022-06-29T09:21:07.522Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}	2	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd", "asn": null, "url": "/api/dcim/sites/0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd/", "name": "Dublin", "slug": "dublin", "tags": [], "region": null, "status": {"label": "Active", "value": "active"}, "tenant": null, "created": "2022-06-29", "display": "Dublin", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": "", "description": "", "contact_name": "", "last_updated": "2022-06-29T09:21:07.522368Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}
5aa513e7-ffa1-47fa-b96c-348879e02562	2022-06-29 09:21:29.218014+00	admin	675dfbea-5211-4c16-be63-967df53366e3	create	32c17dc0-cb64-40b7-a09f-e40f91e2c1de	\N	Converged Cloud	{"name": "Converged Cloud", "slug": "converged-cloud", "tags": [], "group": null, "created": "2022-06-29", "comments": "", "description": "", "last_updated": "2022-06-29T09:21:29.175Z", "custom_fields": {}}	99	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "32c17dc0-cb64-40b7-a09f-e40f91e2c1de", "url": "/api/tenancy/tenants/32c17dc0-cb64-40b7-a09f-e40f91e2c1de/", "name": "Converged Cloud", "slug": "converged-cloud", "tags": [], "group": null, "created": "2022-06-29", "display": "Converged Cloud", "comments": "", "description": "", "last_updated": "2022-06-29T09:21:29.175218Z", "custom_fields": {}}
63a3844a-2b1b-414b-b286-5fd3833a32ca	2022-06-29 09:24:32.91352+00	admin	476d7d13-9b99-4bcb-a9c8-703ce8b3ff8c	create	a63ff8d9-f961-4fc7-949c-bca546b3b2ae	\N	gh-token	{"name": "gh-token", "slug": "gh-token", "tags": [], "created": "2022-06-29", "provider": "environment-variable", "parameters": {"variable": "GH_TOKEN"}, "description": "", "last_updated": "2022-06-29T09:24:32.876Z", "custom_fields": {}}	93	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "a63ff8d9-f961-4fc7-949c-bca546b3b2ae", "url": "/api/extras/secrets/a63ff8d9-f961-4fc7-949c-bca546b3b2ae/", "name": "gh-token", "slug": "gh-token", "tags": [], "created": "2022-06-29", "display": "gh-token", "provider": "environment-variable", "parameters": {"variable": "GH_TOKEN"}, "description": "", "last_updated": "2022-06-29T09:24:32.876701Z", "custom_fields": {}}
36c56d43-e0ba-49b1-9dfb-f956f89b3da9	2022-06-29 09:24:54.243999+00	admin	75237bb8-479c-40fc-bf1b-42709385f193	create	97962bc2-11fa-4833-9ec5-d1316357b113	\N	Github	{"name": "Github", "slug": "github", "created": "2022-06-29", "description": "", "last_updated": "2022-06-29T09:24:54.210Z", "custom_fields": {}}	94	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "97962bc2-11fa-4833-9ec5-d1316357b113", "url": "/api/extras/secrets-groups/97962bc2-11fa-4833-9ec5-d1316357b113/", "name": "Github", "slug": "github", "created": "2022-06-29", "display": "Github", "secrets": [], "description": "", "last_updated": "2022-06-29T09:24:54.210130Z", "custom_fields": {}}
13522c48-6689-4ccc-a5cd-fe942cf73b0c	2022-06-29 09:27:36.084539+00	admin	7c4b266d-608c-433d-907c-f92a774565c8	update	06745599-bc34-41c5-af97-699accfc8ad6	\N	clab-basic-R2	{"face": "", "name": "clab-basic-R2", "rack": null, "site": "0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd", "tags": [], "serial": "", "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": "982fa2a9-48aa-4cfa-b911-64acbe5b446c", "cluster": null, "created": "2022-06-14", "comments": "", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "position": null, "asset_tag": null, "device_role": "5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd", "device_type": "941361f1-bd19-47f8-901a-fba1db0a477e", "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-29T09:27:36.028Z", "custom_fields": {}, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null, "local_context_data_owner_object_id": null, "local_context_data_owner_content_type": null}	1	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "06745599-bc34-41c5-af97-699accfc8ad6", "url": "/api/dcim/devices/06745599-bc34-41c5-af97-699accfc8ad6/", "face": null, "name": "clab-basic-R2", "rack": null, "site": {"id": "0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd", "url": "/api/dcim/sites/0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd/", "name": "Dublin", "slug": "dublin", "display": "Dublin"}, "tags": [], "serial": "", "status": {"label": "Active", "value": "active"}, "tenant": {"id": "982fa2a9-48aa-4cfa-b911-64acbe5b446c", "url": "/api/tenancy/tenants/982fa2a9-48aa-4cfa-b911-64acbe5b446c/", "name": "HEK", "slug": "hek", "display": "HEK"}, "cluster": null, "created": "2022-06-14", "display": "clab-basic-R2", "comments": "", "platform": {"id": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "url": "/api/dcim/platforms/50e0618d-c01a-464d-bb31-002e3c39d0ed/", "name": "Arista EOS", "slug": "arista_eos", "display": "Arista EOS"}, "position": null, "asset_tag": null, "primary_ip": null, "device_role": {"id": "5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd", "url": "/api/dcim/device-roles/5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd/", "name": "router", "slug": "router", "display": "router"}, "device_type": {"id": "941361f1-bd19-47f8-901a-fba1db0a477e", "url": "/api/dcim/device-types/941361f1-bd19-47f8-901a-fba1db0a477e/", "slug": "ceos", "model": "cEOS", "display": "Arista cEOS", "manufacturer": {"id": "cf8f188f-27fd-4294-9afd-5c13bbaa2c90", "url": "/api/dcim/manufacturers/cf8f188f-27fd-4294-9afd-5c13bbaa2c90/", "name": "Arista", "slug": "arista", "display": "Arista"}}, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-29T09:27:36.028615Z", "custom_fields": {}, "parent_device": null, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null}
c16973c0-02b1-4b56-9c44-e237fcdddeda	2022-06-29 09:27:50.819642+00	admin	ae0094ae-e6bd-407a-a3e7-54a73c1773ea	update	81779b36-7a77-4055-b8e9-6eb98e50bff5	\N	clab-basic-R3	{"face": "", "name": "clab-basic-R3", "rack": null, "site": "0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd", "tags": [], "serial": "", "status": "588f4497-9c19-412f-8a41-d8c877e8b863", "tenant": "32c17dc0-cb64-40b7-a09f-e40f91e2c1de", "cluster": null, "created": "2022-06-14", "comments": "", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "position": null, "asset_tag": null, "device_role": "5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd", "device_type": "941361f1-bd19-47f8-901a-fba1db0a477e", "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-29T09:27:50.768Z", "custom_fields": {}, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null, "local_context_data_owner_object_id": null, "local_context_data_owner_content_type": null}	1	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "url": "/api/dcim/devices/81779b36-7a77-4055-b8e9-6eb98e50bff5/", "face": null, "name": "clab-basic-R3", "rack": null, "site": {"id": "0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd", "url": "/api/dcim/sites/0ce2756d-96ee-4d5e-9f3e-f03fce3f71cd/", "name": "Dublin", "slug": "dublin", "display": "Dublin"}, "tags": [], "serial": "", "status": {"label": "Active", "value": "active"}, "tenant": {"id": "32c17dc0-cb64-40b7-a09f-e40f91e2c1de", "url": "/api/tenancy/tenants/32c17dc0-cb64-40b7-a09f-e40f91e2c1de/", "name": "Converged Cloud", "slug": "converged-cloud", "display": "Converged Cloud"}, "cluster": null, "created": "2022-06-14", "display": "clab-basic-R3", "comments": "", "platform": {"id": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "url": "/api/dcim/platforms/50e0618d-c01a-464d-bb31-002e3c39d0ed/", "name": "Arista EOS", "slug": "arista_eos", "display": "Arista EOS"}, "position": null, "asset_tag": null, "primary_ip": null, "device_role": {"id": "5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd", "url": "/api/dcim/device-roles/5eeb90aa-2d5b-440a-ae23-c292b4ec5fbd/", "name": "router", "slug": "router", "display": "router"}, "device_type": {"id": "941361f1-bd19-47f8-901a-fba1db0a477e", "url": "/api/dcim/device-types/941361f1-bd19-47f8-901a-fba1db0a477e/", "slug": "ceos", "model": "cEOS", "display": "Arista cEOS", "manufacturer": {"id": "cf8f188f-27fd-4294-9afd-5c13bbaa2c90", "url": "/api/dcim/manufacturers/cf8f188f-27fd-4294-9afd-5c13bbaa2c90/", "name": "Arista", "slug": "arista", "display": "Arista"}}, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-29T09:27:50.768163Z", "custom_fields": {}, "parent_device": null, "secrets_group": null, "virtual_chassis": null, "local_context_data": null, "local_context_schema": null}
a6eba3e2-d5f2-4e76-b598-caa4ce720a8a	2022-06-29 09:28:59.355839+00	admin	466d2485-7005-46e2-bad4-cfbfcbcbb956	create	5a370232-3ef5-4d31-98d7-1067fc843027	\N	aaa	{"name": "aaa", "slug": "aaa", "tags": [], "created": "2022-06-29", "description": "", "last_updated": "2022-06-29T09:28:59.307Z", "custom_fields": {}}	110	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "5a370232-3ef5-4d31-98d7-1067fc843027", "url": "/api/plugins/golden-config/compliance-feature/5a370232-3ef5-4d31-98d7-1067fc843027/", "name": "aaa", "slug": "aaa", "tags": [], "created": "2022-06-29", "display": "aaa", "description": "", "last_updated": "2022-06-29T09:28:59.307683Z", "custom_fields": {}, "computed_fields": {}, "_custom_field_data": {}}
940dbb43-34eb-458b-a560-01a0f7862e04	2022-06-29 09:29:28.133086+00	admin	58666c05-8a77-4de8-a2f6-adb702e9eb2d	create	a2b1ca21-850a-4809-8983-1393c9286b29	\N	interface	{"name": "interface", "slug": "interface", "tags": [], "created": "2022-06-29", "description": "", "last_updated": "2022-06-29T09:29:28.083Z", "custom_fields": {}}	110	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "a2b1ca21-850a-4809-8983-1393c9286b29", "url": "/api/plugins/golden-config/compliance-feature/a2b1ca21-850a-4809-8983-1393c9286b29/", "name": "interface", "slug": "interface", "tags": [], "created": "2022-06-29", "display": "interface", "description": "", "last_updated": "2022-06-29T09:29:28.083839Z", "custom_fields": {}, "computed_fields": {}, "_custom_field_data": {}}
52b60c43-78bb-4708-b47d-b233047ca393	2022-06-29 09:29:33.483501+00	admin	22c10507-2dc2-4f7c-974a-f63fe9c391a4	create	99a176f0-dc0c-45b8-8c4d-d7381ad7c3a3	\N	ipv6	{"name": "ipv6", "slug": "ipv6", "tags": [], "created": "2022-06-29", "description": "", "last_updated": "2022-06-29T09:29:33.434Z", "custom_fields": {}}	110	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "99a176f0-dc0c-45b8-8c4d-d7381ad7c3a3", "url": "/api/plugins/golden-config/compliance-feature/99a176f0-dc0c-45b8-8c4d-d7381ad7c3a3/", "name": "ipv6", "slug": "ipv6", "tags": [], "created": "2022-06-29", "display": "ipv6", "description": "", "last_updated": "2022-06-29T09:29:33.434406Z", "custom_fields": {}, "computed_fields": {}, "_custom_field_data": {}}
cbc47480-deb6-4121-b822-f0ec9fa0790f	2022-06-29 09:29:40.122255+00	admin	94db98b3-50e4-405f-9fc0-0cb952791da6	create	5864c7f3-17c3-4b3f-acd1-219856b03ddb	\N	prefix-list	{"name": "prefix-list", "slug": "prefix-list", "tags": [], "created": "2022-06-29", "description": "", "last_updated": "2022-06-29T09:29:40.078Z", "custom_fields": {}}	110	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "5864c7f3-17c3-4b3f-acd1-219856b03ddb", "url": "/api/plugins/golden-config/compliance-feature/5864c7f3-17c3-4b3f-acd1-219856b03ddb/", "name": "prefix-list", "slug": "prefix-list", "tags": [], "created": "2022-06-29", "display": "prefix-list", "description": "", "last_updated": "2022-06-29T09:29:40.078231Z", "custom_fields": {}, "computed_fields": {}, "_custom_field_data": {}}
516e6794-d227-4cae-a8ff-903acaf74a02	2022-06-29 09:30:09.904638+00	admin	c30bef7b-d907-4d05-a572-291eeb9fd33f	create	fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2	\N	Arista EOS - aaa	{"tags": [], "created": "2022-06-29", "feature": "5a370232-3ef5-4d31-98d7-1067fc843027", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:30:09.852Z", "match_config": "aaa\\r\\nno aaa\\r\\nmanagement\\r\\nusername\\r\\nrole\\r\\nradius-server", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "url": "/api/plugins/golden-config/compliance-rule/fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2/", "tags": [], "created": "2022-06-29", "display": "Arista EOS - aaa", "feature": "5a370232-3ef5-4d31-98d7-1067fc843027", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:30:09.852794Z", "match_config": "aaa\\r\\nno aaa\\r\\nmanagement\\r\\nusername\\r\\nrole\\r\\nradius-server", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
011e8856-6385-4426-9693-5fc1224698e0	2022-06-29 09:30:33.637626+00	admin	76716009-7990-4629-9149-2e4493995803	create	34004af9-18b2-4e17-aebd-dc23cc972a96	\N	Arista EOS - dns	{"tags": [], "created": "2022-06-29", "feature": "7b582f67-5686-487f-ad4c-ef53a16e6526", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:30:33.589Z", "match_config": "ip domain\\r\\ndns domain", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "34004af9-18b2-4e17-aebd-dc23cc972a96", "url": "/api/plugins/golden-config/compliance-rule/34004af9-18b2-4e17-aebd-dc23cc972a96/", "tags": [], "created": "2022-06-29", "display": "Arista EOS - dns", "feature": "7b582f67-5686-487f-ad4c-ef53a16e6526", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:30:33.589455Z", "match_config": "ip domain\\r\\ndns domain", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
27f24d49-52ad-43ea-973d-47bf5570e536	2022-06-29 09:30:55.191527+00	admin	0cdd6612-ca7b-4f84-854d-5c7d3b12bec6	create	c0bf33e3-f7b5-435d-8b8f-ee2a374a0418	\N	Arista EOS - interface	{"tags": [], "created": "2022-06-29", "feature": "a2b1ca21-850a-4809-8983-1393c9286b29", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:30:55.145Z", "match_config": "interface", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "url": "/api/plugins/golden-config/compliance-rule/c0bf33e3-f7b5-435d-8b8f-ee2a374a0418/", "tags": [], "created": "2022-06-29", "display": "Arista EOS - interface", "feature": "a2b1ca21-850a-4809-8983-1393c9286b29", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:30:55.145587Z", "match_config": "interface", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
ff954851-8868-4c75-952d-6bcdba6b2ad6	2022-06-29 09:31:05.778639+00	admin	0d9482e0-2bf4-46eb-ae74-6025723e5113	create	7b7ee46b-ce47-4a35-8c68-72b65767903e	\N	Arista EOS - ipv6	{"tags": [], "created": "2022-06-29", "feature": "99a176f0-dc0c-45b8-8c4d-d7381ad7c3a3", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:31:05.731Z", "match_config": "ipv6", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "url": "/api/plugins/golden-config/compliance-rule/7b7ee46b-ce47-4a35-8c68-72b65767903e/", "tags": [], "created": "2022-06-29", "display": "Arista EOS - ipv6", "feature": "99a176f0-dc0c-45b8-8c4d-d7381ad7c3a3", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:31:05.731502Z", "match_config": "ipv6", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
71e3ae53-cec3-48ea-ab3c-cd7b19d875f9	2022-06-29 09:31:16.298651+00	admin	4c2185bc-0fba-41dd-ab1e-d0a3b1f86ab6	create	9eef55a6-5038-48bf-8a34-4687c6e233db	\N	Arista EOS - prefix-list	{"tags": [], "created": "2022-06-29", "feature": "5864c7f3-17c3-4b3f-acd1-219856b03ddb", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:31:16.102Z", "match_config": "prefix-list", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "9eef55a6-5038-48bf-8a34-4687c6e233db", "url": "/api/plugins/golden-config/compliance-rule/9eef55a6-5038-48bf-8a34-4687c6e233db/", "tags": [], "created": "2022-06-29", "display": "Arista EOS - prefix-list", "feature": "5864c7f3-17c3-4b3f-acd1-219856b03ddb", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "cli", "description": "", "last_updated": "2022-06-29T09:31:16.102864Z", "match_config": "prefix-list", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
8e2e75b1-3080-46fa-88a8-055d2a10fb32	2022-06-29 09:33:56.687656+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T09:33:56.648Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:33:55.743", "compliance_last_success_date": "2022-06-14T20:53:45.132Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
831f8e7c-bebe-4dd3-948f-1b6c8ef8cba0	2022-06-29 09:31:27.129211+00	admin	0f9355c9-81f2-44e3-adcd-0476df25af7b	update	dacab13e-eb51-4cac-a169-03acb5cbd07c	\N	Execute All Golden Configuration Jobs - Multiple Device	{"name": "Execute All Golden Configuration Jobs - Multiple Device", "slug": "plugins-nautobot_golden_config-jobs-alldevicesgoldenconfig", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-29", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0, "description": "Process to run all Golden Configuration jobs configured against multiple devices.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-29T09:31:27.085Z", "custom_fields": {}, "name_override": false, "commit_default": true, "git_repository": null, "job_class_name": "AllDevicesGoldenConfig", "hidden_override": false, "soft_time_limit": 0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}	12	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "dacab13e-eb51-4cac-a169-03acb5cbd07c", "url": "/api/extras/jobs/dacab13e-eb51-4cac-a169-03acb5cbd07c/", "name": "Execute All Golden Configuration Jobs - Multiple Device", "slug": "plugins-nautobot_golden_config-jobs-alldevicesgoldenconfig", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-29", "display": "Execute All Golden Configuration Jobs - Multiple Device", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0.0, "description": "Process to run all Golden Configuration jobs configured against multiple devices.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-29T09:31:27.085195Z", "custom_fields": {}, "name_override": false, "commit_default": true, "job_class_name": "AllDevicesGoldenConfig", "hidden_override": false, "soft_time_limit": 0.0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}
f5bff6de-8e60-4a99-b255-21167353915b	2022-06-29 09:31:34.107397+00	admin	c18d4f28-c253-41b8-b0c8-83c6c5c7d3f4	update	2c0071d0-ad6e-4aa0-8f4a-956f1e2de900	\N	Execute All Golden Configuration Jobs - Single Device	{"name": "Execute All Golden Configuration Jobs - Single Device", "slug": "plugins-nautobot_golden_config-jobs-allgoldenconfig", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-29", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0, "description": "Process to run all Golden Configuration jobs configured.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-29T09:31:34.059Z", "custom_fields": {}, "name_override": false, "commit_default": true, "git_repository": null, "job_class_name": "AllGoldenConfig", "hidden_override": false, "soft_time_limit": 0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}	12	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "2c0071d0-ad6e-4aa0-8f4a-956f1e2de900", "url": "/api/extras/jobs/2c0071d0-ad6e-4aa0-8f4a-956f1e2de900/", "name": "Execute All Golden Configuration Jobs - Single Device", "slug": "plugins-nautobot_golden_config-jobs-allgoldenconfig", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-29", "display": "Execute All Golden Configuration Jobs - Single Device", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0.0, "description": "Process to run all Golden Configuration jobs configured.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-29T09:31:34.059707Z", "custom_fields": {}, "name_override": false, "commit_default": true, "job_class_name": "AllGoldenConfig", "hidden_override": false, "soft_time_limit": 0.0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}
450d70f4-799b-4ded-852e-c8f2dddf80ce	2022-06-29 09:31:41.868408+00	admin	06201e0b-8e9d-4d24-a867-810817cd5eba	update	69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5	\N	Perform Configuration Compliance	{"name": "Perform Configuration Compliance", "slug": "plugins-nautobot_golden_config-jobs-compliancejob", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-29", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0, "description": "Run configuration compliance on your network infrastructure.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-29T09:31:41.830Z", "custom_fields": {}, "name_override": false, "commit_default": true, "git_repository": null, "job_class_name": "ComplianceJob", "hidden_override": false, "soft_time_limit": 0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}	12	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5", "url": "/api/extras/jobs/69fb8f6c-6eb9-44dc-8eec-0438b4a2e3d5/", "name": "Perform Configuration Compliance", "slug": "plugins-nautobot_golden_config-jobs-compliancejob", "tags": [], "hidden": false, "source": "plugins", "created": "2022-06-29", "display": "Perform Configuration Compliance", "enabled": true, "grouping": "Golden Configuration", "installed": true, "read_only": false, "time_limit": 0.0, "description": "Run configuration compliance on your network infrastructure.", "module_name": "nautobot_golden_config.jobs", "last_updated": "2022-06-29T09:31:41.830103Z", "custom_fields": {}, "name_override": false, "commit_default": true, "job_class_name": "ComplianceJob", "hidden_override": false, "soft_time_limit": 0.0, "approval_required": false, "grouping_override": false, "read_only_override": false, "time_limit_override": false, "description_override": false, "commit_default_override": false, "soft_time_limit_override": false, "approval_required_override": false}
713edc70-a573-47f1-a27f-f96d981dd31a	2022-06-29 09:32:17.274064+00	admin	cab8afd8-a131-4f1d-a802-1badcfd5222d	update	3f5dabb2-61ef-4977-aaff-08fb7e7520fa	\N	gc-backup	{"name": "gc-backup", "slug": "gc-backup", "tags": [], "branch": "main", "created": "2022-06-14", "username": "", "remote_url": "https://github.com/pke11y/pknet_backup.git", "current_head": "3955a55a210e16af45ce823979fd4fa5d86ad769", "last_updated": "2022-06-29T09:32:17.236Z", "custom_fields": {}, "secrets_group": "97962bc2-11fa-4833-9ec5-d1316357b113", "provided_contents": ["nautobot_golden_config.backupconfigs"]}	75	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "3f5dabb2-61ef-4977-aaff-08fb7e7520fa", "url": "/api/extras/git-repositories/3f5dabb2-61ef-4977-aaff-08fb7e7520fa/", "name": "gc-backup", "slug": "gc-backup", "branch": "main", "created": "2022-06-14", "display": "gc-backup", "username": "", "remote_url": "https://github.com/pke11y/pknet_backup.git", "current_head": "3955a55a210e16af45ce823979fd4fa5d86ad769", "last_updated": "2022-06-29T09:32:17.236829Z", "custom_fields": {}, "secrets_group": {"id": "97962bc2-11fa-4833-9ec5-d1316357b113", "url": "/api/extras/secrets-groups/97962bc2-11fa-4833-9ec5-d1316357b113/", "name": "Github", "slug": "github", "display": "Github"}, "provided_contents": ["nautobot_golden_config.backupconfigs"]}
a8134add-f338-4d2b-afb8-67328e97c4fb	2022-06-29 09:32:30.633408+00	admin	597ece41-aa84-416c-abff-01668a449409	update	54515f59-dcf1-419a-b0be-76474be05ebe	\N	gc-intended	{"name": "gc-intended", "slug": "gc-intended", "tags": [], "branch": "main", "created": "2022-06-14", "username": "", "remote_url": "https://github.com/pke11y/pknet_intended.git", "current_head": "fbf9b1ae89fa47d8d88ec681b7107c6ea175e219", "last_updated": "2022-06-29T09:32:30.599Z", "custom_fields": {}, "secrets_group": "97962bc2-11fa-4833-9ec5-d1316357b113", "provided_contents": ["nautobot_golden_config.intendedconfigs"]}	75	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "54515f59-dcf1-419a-b0be-76474be05ebe", "url": "/api/extras/git-repositories/54515f59-dcf1-419a-b0be-76474be05ebe/", "name": "gc-intended", "slug": "gc-intended", "branch": "main", "created": "2022-06-14", "display": "gc-intended", "username": "", "remote_url": "https://github.com/pke11y/pknet_intended.git", "current_head": "fbf9b1ae89fa47d8d88ec681b7107c6ea175e219", "last_updated": "2022-06-29T09:32:30.599467Z", "custom_fields": {}, "secrets_group": {"id": "97962bc2-11fa-4833-9ec5-d1316357b113", "url": "/api/extras/secrets-groups/97962bc2-11fa-4833-9ec5-d1316357b113/", "name": "Github", "slug": "github", "display": "Github"}, "provided_contents": ["nautobot_golden_config.intendedconfigs"]}
2c601e5f-eb07-4620-ae71-fa80db828132	2022-06-29 09:33:56.68815+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T09:33:56.654Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:33:55.743", "compliance_last_success_date": "2022-06-14T20:53:45.132Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a044c4c8-29f5-4995-9ef5-6c7237269c02	2022-06-29 09:33:56.689704+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T09:33:56.658Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:33:55.743", "compliance_last_success_date": "2022-06-14T20:53:45.132Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
29ddc6ee-a97c-4e25-9da9-baf22525484d	2022-06-29 09:33:56.754156+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.723Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
602209fc-caac-4cfe-b10e-35e7b3f170a7	2022-06-29 09:33:56.754912+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.726Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7f2f2c70-f785-4b65-b5a7-0b3319475581	2022-06-29 09:33:56.788804+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.770Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
058630e3-85ff-48ec-8de6-a8c794c47afa	2022-06-29 09:33:56.798638+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.779Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
290b4eaa-e4d0-46f9-afb5-84b26eea5d89	2022-06-29 09:33:56.822587+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.806Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
bae0c604-7bc9-4de6-9a77-ef6f05e506d6	2022-06-29 09:33:56.843058+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.819Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6742d20b-3f39-4b0b-804a-06173880bb73	2022-06-29 09:33:56.870443+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.854Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9e173426-44f5-4590-aa47-76878b3fd319	2022-06-29 09:33:56.886198+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T09:33:56.859Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
373d2954-a116-4a87-bfec-8998345e43c2	2022-06-29 09:33:56.918615+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.901Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c901ecac-b7f0-4024-ba0f-8cf48972b294	2022-06-29 09:33:56.933914+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.913Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3662fd00-a782-40b1-a950-c6ec251926b6	2022-06-29 09:33:56.959668+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T09:33:56.948Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:33:55.743", "compliance_last_success_date": "2022-06-29T09:33:55.743"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
737128c4-617a-4e4d-b892-728556c29529	2022-06-29 09:33:56.960626+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T09:33:56.949Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:33:55.743", "compliance_last_success_date": "2022-06-29T09:33:55.743"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
aa5f2f32-9a1b-4a21-a32d-b01050cd7679	2022-06-29 09:33:56.753665+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.724Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
48256814-d609-4a82-b8b3-5df00c2aa308	2022-06-29 09:33:56.794543+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.771Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
50a297f9-d1ab-4cd8-b7e5-d121da74dcd8	2022-06-29 09:33:56.842287+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.820Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
16b3af19-6d89-42e8-a898-076941cf813e	2022-06-29 09:33:56.885366+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.858Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c4445a45-e0df-4368-9a20-4470284132fa	2022-06-29 09:33:56.94175+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	create	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:33:56.909Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
09d3266c-9354-44bb-bb26-f563d530cfd2	2022-06-29 09:33:57.06996+00	admin	f3dad0ba-4758-437c-9ad3-13e005d1a6e8	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T09:33:57.047Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:33:55.743", "compliance_last_success_date": "2022-06-29T09:33:55.743"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
71621f4c-a627-4444-97c5-fba1490cf0bf	2022-06-29 09:34:33.829987+00	admin	b2da38db-20e4-4509-a212-d76bffc36d53	update	9eef55a6-5038-48bf-8a34-4687c6e233db	\N	Arista EOS - prefix-list	{"tags": [], "created": "2022-06-29", "feature": "5864c7f3-17c3-4b3f-acd1-219856b03ddb", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "custom", "description": "", "last_updated": "2022-06-29T09:34:33.780Z", "match_config": "prefix-list", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "9eef55a6-5038-48bf-8a34-4687c6e233db", "url": "/api/plugins/golden-config/compliance-rule/9eef55a6-5038-48bf-8a34-4687c6e233db/", "tags": [], "created": "2022-06-29", "display": "Arista EOS - prefix-list", "feature": "5864c7f3-17c3-4b3f-acd1-219856b03ddb", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "custom", "description": "", "last_updated": "2022-06-29T09:34:33.780981Z", "match_config": "prefix-list", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
16a4ab2c-7f3c-4dba-b695-2b43e2976d89	2022-06-29 09:34:46.189503+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T09:34:46.170Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:34:45.781", "compliance_last_success_date": "2022-06-29T09:33:55.743Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8edbc1c0-9fb6-43a4-8449-1f39fc73de3c	2022-06-29 09:34:46.19105+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T09:34:46.172Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:34:45.781", "compliance_last_success_date": "2022-06-29T09:33:55.743Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f4fef699-6e08-44f5-8b2a-dc0232fb2a77	2022-06-29 09:34:46.203377+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T09:34:46.181Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:34:45.781", "compliance_last_success_date": "2022-06-29T09:33:55.743Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
af8dc673-6743-460c-b0fe-a2a78f56612c	2022-06-29 09:34:46.286103+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.237Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
93445ee4-1c80-4d9a-ae66-ca79a337a7b3	2022-06-29 09:34:46.286698+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.242Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
90078f3d-cd5c-477f-8356-f67026ca3ac4	2022-06-29 09:34:46.292528+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.241Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
92858c6a-9483-4acc-8b27-074950e7ef36	2022-06-29 09:34:46.345592+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.321Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
77e00606-38b6-4e18-8f92-2743b762d74d	2022-06-29 09:34:46.348452+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.320Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e91feef9-f00d-4c51-816e-3589210d7251	2022-06-29 09:34:46.359969+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.330Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2f77ddc2-d582-4633-b941-2bace5bbd1fe	2022-06-29 09:34:46.393245+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.373Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ebe77835-bdd8-4836-9382-7c4f841b9dc0	2022-06-29 09:34:46.41522+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.388Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
250b80e1-e6a3-42fa-b8eb-8dffb1600cfb	2022-06-29 09:34:46.42869+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.399Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e05ab950-64ed-454d-aca3-2be4a2706474	2022-06-29 09:34:46.464557+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.435Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3fafaf84-892b-4c64-aa8c-1659b2043af3	2022-06-29 09:34:46.481048+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.451Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
052d1393-1db7-491d-bd7c-10477dff5c32	2022-06-29 09:34:46.4885+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T09:34:46.458Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
636ecfce-3c9c-4de7-91fa-d8201410e99f	2022-06-29 09:34:46.587117+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.565Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
55932d22-92bd-4e1d-b578-7c5834c9356f	2022-06-29 09:34:46.649414+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T09:34:46.623Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:34:45.781", "compliance_last_success_date": "2022-06-29T09:34:45.781"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b47ec6ef-bef8-4a46-b982-8a9bc7d6165c	2022-06-29 09:34:46.571899+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.544Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
27ee3325-832f-4e9a-9a41-b3e3f80abeee	2022-06-29 09:34:46.625389+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T09:34:46.599Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:34:45.781", "compliance_last_success_date": "2022-06-29T09:34:45.781"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7d50355c-c91c-4b1d-a974-3bec290ef36b	2022-06-29 09:34:46.572522+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:34:46.541Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4dff6a85-3973-43fe-bf36-430d5da65cde	2022-06-29 09:34:46.621474+00	admin	bb57c67c-b8dd-427b-bd34-0ec5e0625bc7	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T09:34:46.596Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:34:45.781", "compliance_last_success_date": "2022-06-29T09:34:45.781"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
261822e3-72f9-442f-ba79-02fe6bc5ef42	2022-06-29 09:35:34.292617+00	admin	8fd46944-ef1d-45f3-baa7-5c0f3792c7a1	update	982fa2a9-48aa-4cfa-b911-64acbe5b446c	\N	HEK	{"name": "HEK", "slug": "hek", "tags": [], "group": null, "created": "2022-06-29", "comments": "", "description": "", "last_updated": "2022-06-29T09:35:34.216Z", "custom_fields": {}}	99	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "982fa2a9-48aa-4cfa-b911-64acbe5b446c", "url": "/api/tenancy/tenants/982fa2a9-48aa-4cfa-b911-64acbe5b446c/", "name": "HEK", "slug": "hek", "tags": [], "group": null, "created": "2022-06-29", "display": "HEK", "comments": "", "description": "", "last_updated": "2022-06-29T09:35:34.216620Z", "custom_fields": {}}
378ee66f-3a5e-488e-b71e-40cb45ae286c	2022-06-29 09:35:50.014802+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T09:35:49.988Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:35:49.613", "compliance_last_success_date": "2022-06-29T09:34:45.781Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2c7b7829-0d10-4ea7-8d98-c63079a51b5d	2022-06-29 09:35:50.031922+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T09:35:49.999Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:35:49.613", "compliance_last_success_date": "2022-06-29T09:34:45.781Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
be1fb62d-8eef-40a6-bfec-4c33ac982cf1	2022-06-29 09:35:50.038205+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T09:35:49.990Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:35:49.613", "compliance_last_success_date": "2022-06-29T09:34:45.781Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
22d1a10e-72f9-4876-add9-ced3bf3d675b	2022-06-29 09:35:50.166168+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.086Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ca89e546-98b3-4fe5-9f9c-28a4e10778eb	2022-06-29 09:35:50.171035+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.085Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5624ab2f-7627-412e-9e8c-f1acec6a952b	2022-06-29 09:35:50.176006+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.098Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
50b87e6f-adb5-4be5-88a2-634d311624f9	2022-06-29 09:35:50.253412+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.212Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
71812e08-aa37-4eeb-96a1-8aa33311aec2	2022-06-29 09:35:50.271187+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.222Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
08dae380-d195-435f-ace5-0005705314f0	2022-06-29 09:35:50.28445+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.228Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
290e4bdc-0f6f-48c8-b67f-074c62194276	2022-06-29 09:35:50.38801+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.328Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5b094dfd-cdc7-4dc4-8825-785afb775ce8	2022-06-29 09:35:50.400374+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.337Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
14443af4-2f7a-4c45-a3b1-2b48e8d2aef5	2022-06-29 09:35:50.402218+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.324Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3fd82c38-b692-435c-8ffa-b06578a847fd	2022-06-29 09:35:50.505193+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T09:35:50.469Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4a7475b1-1151-4b3a-a401-8af34aa6d429	2022-06-29 09:35:50.50709+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.470Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6b4d503c-58a1-4905-8f80-5f5dc7b3b465	2022-06-29 09:35:50.548151+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.481Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8074e7ab-c9fc-41ab-abdd-91302ee525f9	2022-06-29 09:35:50.775861+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.691Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e021f29c-8aa0-4316-91ad-e9eb79e24ae4	2022-06-29 09:35:50.833668+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T09:35:50.815Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:35:49.613", "compliance_last_success_date": "2022-06-29T09:35:49.613"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b67d785b-39b1-48aa-bd46-10604bf3d1d3	2022-06-29 09:35:50.669935+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.626Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
41afd944-1e03-4957-944e-b5e8491d42ce	2022-06-29 09:35:50.781565+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T09:35:50.747Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:35:49.613", "compliance_last_success_date": "2022-06-29T09:35:49.613"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
34063c44-36af-4ed5-8c42-e951cac92362	2022-06-29 09:35:50.73954+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T09:35:50.689Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
919d41f0-db9a-41fd-8771-4ef656984aea	2022-06-29 09:35:50.809129+00	admin	ab9e7fc0-0f3f-4395-83c7-a5b139628e7a	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T09:35:50.797Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T09:35:49.613", "compliance_last_success_date": "2022-06-29T09:35:49.613"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f43087b8-d23b-4767-b50b-f1786599be1f	2022-06-29 10:01:42.689157+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:01:42.613Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:01:41.700", "compliance_last_success_date": "2022-06-29T09:35:49.613Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e407dc27-82fd-4b21-ab12-69d4d27b4f4f	2022-06-29 10:01:42.694494+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:01:42.608Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:01:41.700", "compliance_last_success_date": "2022-06-29T09:35:49.613Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
487a92c8-fc88-439c-b663-4b7f4542a75a	2022-06-29 10:01:42.737696+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:01:42.691Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:01:41.700", "compliance_last_success_date": "2022-06-29T09:35:49.613Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4a7b04c6-2d92-40ed-b904-466069f59e8d	2022-06-29 10:01:42.875132+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:42.802Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
975f033f-6bd4-4e29-b8a5-086ab6f89d5a	2022-06-29 10:01:42.877516+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:42.794Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1e71ee7a-4602-4e35-8118-31d355a5a8e1	2022-06-29 10:01:42.888861+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:42.842Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
edb4042f-f2f5-4a87-859a-1b87ca7d4c11	2022-06-29 10:01:42.997352+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:42.934Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
eb84d1a3-ca1a-4688-a1fa-fba0b3d43c64	2022-06-29 10:01:43.098916+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:42.955Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ac9a245f-3996-41ac-90aa-e2ca353c0faf	2022-06-29 10:01:43.105256+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:42.945Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f054a183-b354-45df-9475-9cc34acd6059	2022-06-29 10:01:43.184705+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:43.133Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d8225a99-dd37-4f8c-a7ea-0c4995648736	2022-06-29 10:01:43.256064+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:43.168Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7219434a-2660-428a-bf1b-147f9561f295	2022-06-29 10:01:43.259317+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:43.179Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
bbf3c176-25d2-4610-94fb-bb40651df43a	2022-06-29 10:01:43.31376+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:43.266Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7410d052-e11a-4c3d-a2f5-ab5fcb0a68a4	2022-06-29 10:01:43.389129+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T10:01:43.326Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
03a0f050-b62c-4ae5-afd8-cc761dbcdaff	2022-06-29 10:01:43.495954+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:43.346Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3ba219ff-8de0-4ff8-96fb-856d78290b87	2022-06-29 10:01:43.697465+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:43.642Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
cb064095-1884-495d-a90a-b1bb43fdfcd2	2022-06-29 10:01:43.849668+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:01:43.789Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:01:41.700", "compliance_last_success_date": "2022-06-29T10:01:41.700"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
71997058-2eb7-45cc-9502-bb9b0b134cd9	2022-06-29 10:01:43.593715+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:43.548Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
89f2be6f-65e2-4a98-97d7-4fe207a1c56c	2022-06-29 10:01:43.698991+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:01:43.663Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:01:41.700", "compliance_last_success_date": "2022-06-29T10:01:41.700"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
35006dcf-9d52-4293-9b4e-30be092fd211	2022-06-29 10:01:43.658428+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:01:43.608Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b30e2667-572c-4004-b42c-8171bc803bc5	2022-06-29 10:01:43.809968+00	admin	297894e0-fb8d-4b19-ad58-602d299649c2	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:01:43.761Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:01:41.700", "compliance_last_success_date": "2022-06-29T10:01:41.700"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5149a08a-c3b2-4855-8825-0091b5f5a0cc	2022-06-29 10:12:30.950586+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:12:30.896Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:12:29.815", "compliance_last_success_date": "2022-06-29T10:01:41.700Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3f85aa0b-5074-4fd0-9b75-92f5bb191cd9	2022-06-29 10:12:30.952251+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:12:30.895Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:12:29.815", "compliance_last_success_date": "2022-06-29T10:01:41.700Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
96be4397-7e5d-4e44-9d8a-fe6dadb512e9	2022-06-29 10:12:30.95401+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:12:30.925Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:12:29.815", "compliance_last_success_date": "2022-06-29T10:01:41.700Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e4cc9403-0160-4987-bad4-df715a0a0aa1	2022-06-29 10:12:31.097969+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.010Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d1e7bfa0-0199-4fb0-8654-beb9a4bfcab5	2022-06-29 10:12:31.099732+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.023Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
937e2feb-5131-4322-95ed-221593afa49f	2022-06-29 10:12:31.10538+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.030Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
eb023ed5-9d98-4795-9a1c-693f9571fafa	2022-06-29 10:12:31.314587+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.164Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d04adcac-e8a9-46c0-8bc8-773ee8841aa0	2022-06-29 10:12:31.328289+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.180Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
95561247-5b03-48b7-839e-0ed6464d0dd7	2022-06-29 10:12:31.378148+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.310Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
23ae1681-a239-4610-97e1-1c194bacbb24	2022-06-29 10:12:31.500908+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.425Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
63620dea-7701-41ab-a2ef-9360eb369aca	2022-06-29 10:12:31.514756+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.435Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5a6ae586-8ad0-432a-bfcf-4ae9ec3835ed	2022-06-29 10:12:31.532978+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.458Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4fb75aed-391b-4212-93e9-ea5875a7d031	2022-06-29 10:12:31.654874+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T10:12:31.578Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c0478443-bcaa-4cf5-9014-cbdb468fa112	2022-06-29 10:12:31.678353+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.586Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2f18db4c-6c5f-40bc-8016-b1e3744a4b98	2022-06-29 10:12:31.692413+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.584Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e2466adf-6221-444e-afae-ea3731f3d0be	2022-06-29 10:12:31.928909+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.868Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1bc3c356-fde7-4817-bca9-4a5012c7be45	2022-06-29 10:12:32.083634+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:12:32.058Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:12:29.815", "compliance_last_success_date": "2022-06-29T10:12:29.815"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b0074ace-97b9-424b-83f3-0571ed7ec1b7	2022-06-29 10:12:31.841889+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.758Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
fbf58f0b-0583-4499-88ca-05dd41d7327d	2022-06-29 10:12:31.939735+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:12:31.925Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:12:29.815", "compliance_last_success_date": "2022-06-29T10:12:29.815"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
70f12f73-8c25-4a2c-9934-1b6b6b7c12b4	2022-06-29 10:12:31.916255+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:12:31.847Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1250b627-57be-4cb6-8f1b-204dd8ae35ca	2022-06-29 10:12:32.082906+00	admin	166db978-5958-4920-8717-c6e1036d563c	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:12:32.066Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:12:29.815", "compliance_last_success_date": "2022-06-29T10:12:29.815"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
25c62957-54ae-45b9-863c-84adda22b22e	2022-06-29 10:21:12.043785+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:21:11.968Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:21:11.256", "compliance_last_success_date": "2022-06-29T10:12:29.815Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1aac39bb-98ed-4fad-b035-ac95402b83f9	2022-06-29 10:21:12.048997+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:21:11.952Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:21:11.256", "compliance_last_success_date": "2022-06-29T10:12:29.815Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d08d9878-907d-44aa-9eba-d1ab64c8b7e3	2022-06-29 10:21:12.052293+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:21:11.981Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:21:11.256", "compliance_last_success_date": "2022-06-29T10:12:29.815Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a6ccec54-fc28-47aa-9b44-360ad96b5927	2022-06-29 10:21:12.262542+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.174Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2f59386c-7f7c-4f7f-97da-9ca9d10f87f1	2022-06-29 10:21:12.273404+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.172Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2f634cce-ad4a-4443-bc03-8b7f7b34726b	2022-06-29 10:21:12.28879+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.194Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7dd5a734-21ab-49f1-8d10-d9f6862028a8	2022-06-29 10:21:12.600635+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.531Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
13dbd142-9384-4432-b836-cfe200eace6c	2022-06-29 10:21:12.632776+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.522Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
0f00bc28-dee1-4669-9d3c-2bcdd60ebeff	2022-06-29 10:21:12.647819+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.548Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8e738add-a8f2-4817-8342-3e246704c242	2022-06-29 10:21:12.788926+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.701Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7eaefa44-d531-4afc-9afb-8bc4a7fae09a	2022-06-29 10:21:12.793563+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.714Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
75f78a37-b660-4b80-a41a-05d5a6683891	2022-06-29 10:21:12.807212+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.724Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1709ffdb-d170-433d-b232-17aa07e00d46	2022-06-29 10:21:12.960398+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T10:21:12.897Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b7a2c0c0-f0b1-4671-9678-b18334e628de	2022-06-29 10:21:12.973454+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.895Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9d7f302a-8e86-4600-9806-16b8ead48b65	2022-06-29 10:21:12.987284+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:12.910Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
53732979-34ff-4b41-a843-220d2e665469	2022-06-29 10:21:13.229847+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:13.179Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7ed7c09c-76c9-41b3-87a1-385a5f753f88	2022-06-29 10:21:13.297466+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:21:13.278Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:21:11.256", "compliance_last_success_date": "2022-06-29T10:21:11.256"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f41216c3-a2d0-4142-b967-3f635c9e561d	2022-06-29 10:21:13.203987+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:13.151Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8d7494ab-3c91-42cd-9baa-97fb8965df3d	2022-06-29 10:21:13.260423+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:21:13.245Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:21:11.256", "compliance_last_success_date": "2022-06-29T10:21:11.256"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6d926842-9128-4cb7-8e20-ab72c5b6cfc4	2022-06-29 10:21:13.244819+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:21:13.204Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
dfd5bc96-a503-4a6e-b1e0-55889b29d53b	2022-06-29 10:21:13.302525+00	admin	08277dcc-9de5-45ef-addd-81c86b8cc40e	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:21:13.283Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:21:11.256", "compliance_last_success_date": "2022-06-29T10:21:11.256"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
13f4cc42-a15a-4f51-b5d6-cab9f50262ac	2022-06-29 10:39:47.594752+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:39:47.499Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:39:45.939", "compliance_last_success_date": "2022-06-29T10:21:11.256Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a1dced79-b236-4d59-9d80-6a97cef50c81	2022-06-29 10:39:47.597334+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:39:47.528Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:39:45.939", "compliance_last_success_date": "2022-06-29T10:21:11.256Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f2ad4143-1e4f-49e3-b43c-cd87f8d4da40	2022-06-29 10:39:47.598758+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:39:47.508Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:39:45.939", "compliance_last_success_date": "2022-06-29T10:21:11.256Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7f9f11b7-f149-4a31-ad05-c6277fdf7746	2022-06-29 10:39:47.774498+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:47.676Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1fec242c-100b-44e7-a725-b84d055349e1	2022-06-29 10:39:47.778365+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:47.679Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
32d52002-0b9a-42ef-a2b5-dfd6b82c6722	2022-06-29 10:39:47.798792+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:47.675Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
089a12c3-d982-4e6a-bd43-c1b6211ddb2b	2022-06-29 10:39:47.928755+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:47.845Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8420fbf7-0af4-453d-88cb-ca2e9c8f8d14	2022-06-29 10:39:48.0594+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:47.850Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a37d7e63-f9f3-49ec-8510-4e71dd80a78b	2022-06-29 10:39:48.071376+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:47.859Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b3428813-e33a-4d16-a129-5dcdf305f990	2022-06-29 10:39:48.267186+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:48.122Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1460b957-b6c5-4c85-83cf-4b33c87fbcdc	2022-06-29 10:39:48.269337+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:48.176Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
935c0257-c219-45f4-9058-58728c7aec82	2022-06-29 10:39:48.272935+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:48.168Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
487629b4-5473-420a-93ce-ae432c3fbc6b	2022-06-29 10:39:48.498168+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:48.365Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
442d5fcf-eb53-4b64-a40c-ad0559b5b3b6	2022-06-29 10:39:48.517702+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:48.370Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7c0e37e4-9307-4b4c-a391-0e2903267da2	2022-06-29 10:39:48.544075+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T10:39:48.383Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
32f1d1e5-5504-486a-b96b-720b7b9358bd	2022-06-29 10:39:48.865186+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:48.760Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3f0fd394-b1b2-4ade-9049-9d04e7fd36a9	2022-06-29 10:39:48.964221+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:39:48.925Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:39:45.939", "compliance_last_success_date": "2022-06-29T10:39:45.939"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e95e8bb1-d95c-48a1-aff6-d38055a59c5c	2022-06-29 10:39:48.826703+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:48.742Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9996974b-6326-46b5-b929-1c6fdf176ceb	2022-06-29 10:39:48.8948+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:39:48.868Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:39:45.939", "compliance_last_success_date": "2022-06-29T10:39:45.939"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
788e1814-0788-460f-8097-d8dfb9442a8b	2022-06-29 10:39:48.849342+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:39:48.747Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7428a895-e8b2-444f-a795-f18665abb336	2022-06-29 10:39:48.939943+00	admin	305c4795-5bea-4c36-9d23-5bb4527f31d7	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:39:48.905Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:39:45.939", "compliance_last_success_date": "2022-06-29T10:39:45.939"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9b905809-854a-4392-8522-689f6cc32eec	2022-06-29 10:54:18.375193+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:54:18.309Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:54:17.305", "compliance_last_success_date": "2022-06-29T10:39:45.939Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
892afc89-776c-47a8-bde7-85eb1dbefcbc	2022-06-29 10:54:18.3763+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:54:18.340Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:54:17.305", "compliance_last_success_date": "2022-06-29T10:39:45.939Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d9bfeaa7-1124-46ca-ac83-03aea574fd18	2022-06-29 10:54:18.379939+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:54:18.354Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:54:17.305", "compliance_last_success_date": "2022-06-29T10:39:45.939Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ff5ced44-a5f2-40e6-bff3-24270e6a232e	2022-06-29 10:54:18.503187+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.437Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1a130d5c-6612-4f45-a39c-bbb186e294f5	2022-06-29 10:54:18.504314+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.432Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7d3a8c65-3395-41e1-9cef-ef1d7928e0f6	2022-06-29 10:54:18.507762+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.440Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c6e49f69-7538-4d13-97bf-83fbc1d14efe	2022-06-29 10:54:18.596853+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.545Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
430eccb3-6cdb-4d4b-afa2-023a040c5929	2022-06-29 10:54:18.636005+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.590Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
091af809-ce09-4b7e-bb96-0eb905b070ec	2022-06-29 10:54:18.681758+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.598Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4d687574-eb94-4d01-9d4a-968be533fde3	2022-06-29 10:54:18.74326+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.695Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e8ee63ee-50a4-4508-9bb3-6e5682c42905	2022-06-29 10:54:18.7726+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.714Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d5e0c3da-a647-4653-a0a0-7907d88709dd	2022-06-29 10:54:18.822528+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.778Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1b4e7b43-26f1-43f1-ad15-435f8a599fe3	2022-06-29 10:54:18.879777+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.823Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
05a7c546-6544-447d-a6e7-07598eae2cd6	2022-06-29 10:54:18.91552+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T10:54:18.846Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
eedc4ad5-5cff-41c1-b203-5150312c95d6	2022-06-29 10:54:18.943635+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:18.896Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d7cbdd80-953d-4e27-b6bb-317aef1c38b9	2022-06-29 10:54:19.184686+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:19.110Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d6656e0f-7cd5-42e8-bf71-0b06a9f1cc56	2022-06-29 10:54:19.325105+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:54:19.312Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:54:17.305", "compliance_last_success_date": "2022-06-29T10:54:17.305"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
aa828905-f83c-4c2c-b107-98fc582469d7	2022-06-29 10:54:19.138292+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:19.048Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e1ac2ffe-04be-4a32-b49b-6e0d44d638b8	2022-06-29 10:54:19.241458+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:54:19.214Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:54:17.305", "compliance_last_success_date": "2022-06-29T10:54:17.305"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
746493cb-8144-450c-ae05-2a70560a3c1b	2022-06-29 10:54:19.162594+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:54:19.087Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
41f86142-1d1b-45cf-9d4e-8b01fcdb38b0	2022-06-29 10:54:19.226513+00	admin	f7068943-af2b-46b3-951d-1ec586dc5656	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:54:19.206Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:54:17.305", "compliance_last_success_date": "2022-06-29T10:54:17.305"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1adbb3e8-eca7-40b7-9f97-0a5d79497392	2022-06-29 10:58:52.857608+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:58:52.767Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:58:51.890", "compliance_last_success_date": "2022-06-29T10:54:17.305Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a1b64bec-47f4-42c0-bcf6-5a811d8ccc7b	2022-06-29 10:58:52.858639+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:58:52.798Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:58:51.890", "compliance_last_success_date": "2022-06-29T10:54:17.305Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e5521ed0-fb7d-415a-9589-62625e7f759b	2022-06-29 10:58:52.861046+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:58:52.807Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:58:51.890", "compliance_last_success_date": "2022-06-29T10:54:17.305Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6de4b2da-76e7-4722-b5b6-a572671f8a21	2022-06-29 10:58:52.997534+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:52.920Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b0c12fd2-ba97-42b2-a2ab-56e624e3dcd3	2022-06-29 10:58:53.011602+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:52.922Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
105e20b2-a2aa-4cff-837c-b43bc4bea66f	2022-06-29 10:58:53.062497+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:52.921Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
57b20779-3c50-4dc0-a661-b302158b1131	2022-06-29 10:58:53.163648+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.129Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
45996ef3-f32e-4bbb-aa9e-451b60cc734c	2022-06-29 10:58:53.227392+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.145Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a445a38a-ccfc-4b38-94f6-1a8d3661dbb3	2022-06-29 10:58:53.241609+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.173Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
0c8f7079-db70-4755-b2cd-a6e0cce2ad24	2022-06-29 10:58:53.293955+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.253Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e368bcbb-ef8d-4bc3-a111-8f314537766a	2022-06-29 10:58:53.338415+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.294Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
bdc8a962-d6f8-4e43-bee0-67219a7d5ae9	2022-06-29 10:58:53.490608+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.342Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1c256ecd-bc78-4307-aeef-e5f780238d0a	2022-06-29 10:58:53.537064+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T10:58:53.456Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d66cf113-b4de-45e2-a171-f0b404946250	2022-06-29 10:58:53.592052+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.501Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
16ae4553-2b4c-4786-9041-18bc2b7a5bcc	2022-06-29 10:58:53.666546+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.556Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
17f5412d-a1d6-41de-81c4-89f426647a80	2022-06-29 10:58:53.936767+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.912Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
35c0dc06-6722-42a9-85af-ceb294a363db	2022-06-29 10:58:54.096043+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T10:58:54.060Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:58:51.890", "compliance_last_success_date": "2022-06-29T10:58:51.890"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d637302e-e7cb-459c-8397-3d3d85249931	2022-06-29 10:58:53.927256+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.860Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f321abdc-1c87-46b9-ab96-72b4ccd8b59b	2022-06-29 10:58:54.07776+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T10:58:54.052Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:58:51.890", "compliance_last_success_date": "2022-06-29T10:58:51.890"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
de1e3f5c-ba0b-4693-b667-4ddbe7f103d9	2022-06-29 10:58:53.93972+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T10:58:53.841Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
64620f20-9cb7-46da-8b0b-8381c919c756	2022-06-29 10:58:54.07323+00	admin	beeb7bde-43ad-4bfb-8a8a-b2ab58224595	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T10:58:54.038Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T10:58:51.890", "compliance_last_success_date": "2022-06-29T10:58:51.890"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ab1669da-ab4a-472a-9fd0-fb61f5f9015f	2022-06-29 11:05:30.545113+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:05:30.484Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:05:29.633", "compliance_last_success_date": "2022-06-29T10:58:51.890Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d392d426-9afd-4bc9-8342-40ec08467e28	2022-06-29 11:05:30.546542+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:05:30.523Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:05:29.633", "compliance_last_success_date": "2022-06-29T10:58:51.890Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
720be880-1b8e-49c0-b0f1-522969a09f76	2022-06-29 11:05:30.547988+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:05:30.502Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:05:29.633", "compliance_last_success_date": "2022-06-29T10:58:51.890Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4c19b08f-d38f-4975-9ebc-acaafdcd04f7	2022-06-29 11:05:30.708076+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.615Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
71613930-858c-4851-92f6-b61b3d5405c8	2022-06-29 11:05:30.716262+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.611Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
66b5b7f2-fa22-4b9c-bfd4-d0e0699e5d2c	2022-06-29 11:05:30.742365+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.634Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
562f8a46-f699-402f-9056-9f25f7d02608	2022-06-29 11:05:30.890788+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.796Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
217c7411-d487-46af-ad66-317f110d9e07	2022-06-29 11:05:30.902295+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.825Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f5f991e4-d2ae-4abc-886d-007f652a8b07	2022-06-29 11:05:30.917386+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.828Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9cae788f-8742-4893-94d5-50a4026e541c	2022-06-29 11:05:30.987782+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.948Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
684fd292-647d-4a6e-86e3-76eb5f5e9b35	2022-06-29 11:05:31.005833+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.947Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f570dccb-e356-455a-b13b-faf7e5419c4c	2022-06-29 11:05:31.031413+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:30.965Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ab0af056-5943-47c6-ac62-f6a14f3c9c5e	2022-06-29 11:05:31.188678+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:31.086Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b47d6783-1b95-41bc-83b0-5756d90adda5	2022-06-29 11:05:31.225548+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:31.093Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2cf859c2-0bc5-418b-a07d-8b1f9289871a	2022-06-29 11:05:31.241284+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T11:05:31.184Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3e022f3f-66da-47da-b520-683f068f7ba4	2022-06-29 11:05:31.455584+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:31.362Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1093ec36-171b-4f7e-9793-b792837b5cdb	2022-06-29 11:05:31.628296+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:05:31.538Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:05:29.633", "compliance_last_success_date": "2022-06-29T11:05:29.633"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9c4a9d66-7dcb-4648-a6e8-03c6472c6c74	2022-06-29 11:05:31.446165+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:31.364Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
66282657-aef9-49fe-ad70-c7f2b90593f2	2022-06-29 11:05:31.626845+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:05:31.525Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:05:29.633", "compliance_last_success_date": "2022-06-29T11:05:29.633"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ceb9dbfb-5ec0-41c0-81c2-011150263a1e	2022-06-29 11:05:31.475254+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:05:31.380Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
cb6be95e-364d-4f40-bd53-d6f4e4a23636	2022-06-29 11:05:31.593771+00	admin	79b0ff53-3744-42b8-bca7-ddf8bbaec4dc	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:05:31.519Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:05:29.633", "compliance_last_success_date": "2022-06-29T11:05:29.633"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c0f4a0c3-f054-4bc8-ae27-192804312cf2	2022-06-29 11:07:35.307965+00	admin	fa26524d-cd2f-4c0c-a327-d3288bef9c43	update	9eef55a6-5038-48bf-8a34-4687c6e233db	\N	Arista EOS - prefix-list	{"tags": [], "created": "2022-06-29", "feature": "5864c7f3-17c3-4b3f-acd1-219856b03ddb", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "custom", "description": "", "last_updated": "2022-06-29T11:07:35.207Z", "match_config": "ip prefix-list", "custom_fields": {}, "config_ordered": false}	111	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	{"id": "9eef55a6-5038-48bf-8a34-4687c6e233db", "url": "/api/plugins/golden-config/compliance-rule/9eef55a6-5038-48bf-8a34-4687c6e233db/", "tags": [], "created": "2022-06-29", "display": "Arista EOS - prefix-list", "feature": "5864c7f3-17c3-4b3f-acd1-219856b03ddb", "platform": "50e0618d-c01a-464d-bb31-002e3c39d0ed", "config_type": "custom", "description": "", "last_updated": "2022-06-29T11:07:35.207375Z", "match_config": "ip prefix-list", "custom_fields": {}, "config_ordered": false, "computed_fields": {}, "_custom_field_data": {}}
a7b90c76-1a57-4b27-9fda-24b5d615a464	2022-06-29 11:07:55.823006+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:07:55.792Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:07:55.147", "compliance_last_success_date": "2022-06-29T11:05:29.633Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
fa05ea09-8a61-4ae1-b0a7-cc1bb4353ea3	2022-06-29 11:07:55.825584+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:07:55.777Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:07:55.147", "compliance_last_success_date": "2022-06-29T11:05:29.633Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
feebba39-9255-4068-b9ee-68f7b7c77b63	2022-06-29 11:07:55.875696+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:07:55.809Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:07:55.147", "compliance_last_success_date": "2022-06-29T11:05:29.633Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5cc3729a-9369-4d7a-8eaf-dcfb11c80f5a	2022-06-29 11:07:55.95931+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:55.900Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
180446d2-3a4f-4239-9ff7-03ef64c0175b	2022-06-29 11:07:56.090452+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:55.926Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
fe0c0ec6-c0d0-4ce8-b813-b9eb81db3dd6	2022-06-29 11:07:56.122937+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:55.932Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
58c079bc-518e-41f3-a258-12f334349288	2022-06-29 11:07:56.248038+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.102Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2cbc1e7a-8691-40ce-b0b1-93f92f562ea9	2022-06-29 11:07:56.332196+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.187Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d50207bc-5889-4062-b014-ebaa717378f3	2022-06-29 11:07:56.348941+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.282Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
23874d99-a2e4-4daf-81c0-bcea7346929f	2022-06-29 11:07:56.432059+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.389Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c4887c98-2a87-4c9a-af29-02f1295bfda8	2022-06-29 11:07:56.565432+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.451Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
dc5c22a4-d249-4890-9364-4a44605de213	2022-06-29 11:07:56.618376+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.488Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8539c808-a19f-41a5-a9b0-32ef397fb314	2022-06-29 11:07:56.73292+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.636Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
da7fbed7-899b-415a-854f-9b801ed56d37	2022-06-29 11:07:57.034822+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.994Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f754766f-2a65-45ca-998e-2de97deea97a	2022-06-29 11:07:57.153562+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:07:57.129Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:07:55.147", "compliance_last_success_date": "2022-06-29T11:07:55.147"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2cff549e-0dca-4364-8245-36fda1bf7764	2022-06-29 11:07:56.815067+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:56.762Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
262c94dd-043c-496d-ac12-d08d3628a979	2022-06-29 11:07:57.096848+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:57.048Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2a513a37-70f7-4b1e-a058-fbeab92985bb	2022-06-29 11:07:57.192956+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:07:57.176Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:07:55.147", "compliance_last_success_date": "2022-06-29T11:07:55.147"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
04f27ec7-aa73-4ecd-b7e1-68b5a283703a	2022-06-29 11:07:56.830453+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T11:07:56.723Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ebc8efdc-f673-4a8c-83f0-374108db7529	2022-06-29 11:07:57.134105+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:07:57.089Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d29d82e3-1867-412b-aef5-02a8e49d9c07	2022-06-29 11:07:57.201856+00	admin	7ca9e202-47ef-41e9-be72-f5c266eed047	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:07:57.186Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:07:55.147", "compliance_last_success_date": "2022-06-29T11:07:55.147"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3af5ff3b-87aa-4990-b5f2-4470e4738192	2022-06-29 11:10:53.634456+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:10:53.584Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:10:52.685", "compliance_last_success_date": "2022-06-29T11:07:55.147Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8a288e28-8a6a-4e78-97d2-52513a9ccfa3	2022-06-29 11:10:53.636472+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:10:53.600Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:10:52.685", "compliance_last_success_date": "2022-06-29T11:07:55.147Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
0ec456a7-0b1d-4649-87c7-ee914e0ba169	2022-06-29 11:10:53.645741+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:10:53.591Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:10:52.685", "compliance_last_success_date": "2022-06-29T11:07:55.147Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
caaf8801-4937-4091-9c67-e0cc3c1b285e	2022-06-29 11:10:53.818789+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:53.749Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e6dd909f-60d1-4355-b61c-987c9fcadd72	2022-06-29 11:10:53.826777+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:53.753Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c04cf42b-b64f-4689-a7ea-af57284d02e0	2022-06-29 11:10:53.835289+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:53.775Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
0a672feb-ab47-4f47-b8da-70ff16962851	2022-06-29 11:10:53.976488+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:53.908Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b793d382-5d96-4446-b6de-a86b7416e666	2022-06-29 11:10:53.988531+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:53.906Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4cb873f9-74db-4e3f-8cdb-8a725b520f5e	2022-06-29 11:10:53.99219+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:53.907Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
be21e36c-894a-49d1-869e-5c4cd59c1a78	2022-06-29 11:10:54.142898+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:54.027Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b151521b-6944-474a-9feb-c12f63ae24dc	2022-06-29 11:10:54.176566+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:54.049Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
41c7500f-56f6-41f1-8e54-d6553087f907	2022-06-29 11:10:54.185703+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:54.092Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4c331deb-31e9-43b7-ac67-ea9d51972531	2022-06-29 11:10:54.26765+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:54.225Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
001e7847-b4fe-48ec-b41f-eb3ce04a132d	2022-06-29 11:10:54.298973+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:54.245Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4c4f1340-f084-451d-83e8-d1df49c2de51	2022-06-29 11:10:54.601829+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:54.534Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
28efc1e9-47e8-4de0-a594-0c89d8580c13	2022-06-29 11:10:54.703146+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:10:54.648Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:10:52.685", "compliance_last_success_date": "2022-06-29T11:10:52.685"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f7d50ee2-5914-46a9-a01c-d02ccf98bcac	2022-06-29 11:10:54.336127+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T11:10:54.287Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
96288c6d-6c47-4dcb-aecd-60764e7a807a	2022-06-29 11:10:54.578107+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:54.558Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
adc9bfe8-d842-4341-9c8c-200301a10614	2022-06-29 11:10:54.677309+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:10:54.635Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:10:52.685", "compliance_last_success_date": "2022-06-29T11:10:52.685"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a106fb26-2535-4726-bee1-2325c7800558	2022-06-29 11:10:54.539737+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:10:54.411Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
bfd4e40f-1b5d-4c6b-b6b2-ef61854219d8	2022-06-29 11:10:54.616659+00	admin	da72b9df-ee6c-40b2-ac7d-c63f098c41b2	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:10:54.593Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:10:52.685", "compliance_last_success_date": "2022-06-29T11:10:52.685"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7bae22c3-2939-4969-8e9b-abe1127f3103	2022-06-29 11:13:52.710154+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:13:52.625Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:13:51.775", "compliance_last_success_date": "2022-06-29T11:10:52.685Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9078eddb-82c7-457f-80a6-8c57d2ce7cd6	2022-06-29 11:13:52.709147+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:13:52.637Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:13:51.775", "compliance_last_success_date": "2022-06-29T11:10:52.685Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f3e678ef-6831-4f03-ab05-ae314fd6e5aa	2022-06-29 11:13:52.711229+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:13:52.634Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:13:51.775", "compliance_last_success_date": "2022-06-29T11:10:52.685Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
08fe4380-67f6-467c-91a1-75e385189573	2022-06-29 11:13:52.880361+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:52.807Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a5ff5c53-80c9-47b3-aa4a-a765835dc220	2022-06-29 11:13:52.882127+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:52.808Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e0a5e45e-5270-4954-9499-d64f6bdb9025	2022-06-29 11:13:52.885046+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:52.805Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9adb6030-f7c6-49fc-8567-040222f97b57	2022-06-29 11:13:52.996688+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:52.936Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7edc47e9-5d66-4d0b-91af-dfc740b1998c	2022-06-29 11:13:53.099603+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:52.935Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c0117bab-6d91-4f38-81e2-2547bfe093a4	2022-06-29 11:13:53.110101+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:52.954Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
8f14eb83-3d53-4af7-8f9b-438b2731aab9	2022-06-29 11:13:53.241123+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:53.149Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a699dfec-c7bd-4eb9-b453-2e7a0dc1dfd0	2022-06-29 11:13:53.25467+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:53.161Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ef616004-0aaf-4722-82de-a774a14615cf	2022-06-29 11:13:53.270887+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:53.188Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
81ad0c86-6521-4e42-9aef-3936e4848318	2022-06-29 11:13:53.368147+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:53.306Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a1ab1de0-fa96-4c28-a19a-48b732fdd93b	2022-06-29 11:13:53.407532+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:53.350Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
71dab662-bfcd-41bb-af0f-127915316ecf	2022-06-29 11:13:53.427049+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T11:13:53.348Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
073713c5-db01-466e-960e-bf08de70e4d5	2022-06-29 11:13:53.703777+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:53.650Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
01126174-706e-48c4-a75c-1d0a01693077	2022-06-29 11:13:53.819145+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:13:53.751Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:13:51.775", "compliance_last_success_date": "2022-06-29T11:13:51.775"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3301a814-af23-4d14-b7f1-79864f210b42	2022-06-29 11:13:53.613637+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:53.532Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7d759b7e-feb1-4091-8dca-78d80675eba8	2022-06-29 11:13:53.731048+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:13:53.696Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:13:51.775", "compliance_last_success_date": "2022-06-29T11:13:51.775"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
740e69a3-027c-42f1-85d2-20e6e9c5982a	2022-06-29 11:13:53.669663+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:13:53.618Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
493502e8-3a64-4cc2-a829-d9405d6bd5bc	2022-06-29 11:13:53.760652+00	admin	9d1eb435-82b3-4034-a8b5-b8018eb589bd	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:13:53.716Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:13:51.775", "compliance_last_success_date": "2022-06-29T11:13:51.775"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d8d56670-2bdc-4bdf-a9e6-072b34f6b500	2022-06-29 11:25:59.187465+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:25:59.132Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:25:58.097", "compliance_last_success_date": "2022-06-29T11:13:51.775Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
22d41030-144e-43a4-8e00-52cf2e71b246	2022-06-29 11:25:59.189766+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:25:59.107Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:25:58.097", "compliance_last_success_date": "2022-06-29T11:13:51.775Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5d3b678e-968d-4552-9857-367e55cc829e	2022-06-29 11:25:59.191913+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:25:59.119Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:25:58.097", "compliance_last_success_date": "2022-06-29T11:13:51.775Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
959ada3d-ce63-453b-84aa-e5d2cf810d3c	2022-06-29 11:25:59.425122+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.250Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
0c6c7379-d98a-488f-a20f-8e9f9eac5133	2022-06-29 11:25:59.426013+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.267Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ae201155-e231-4fd9-90a6-d9260e5ae3e1	2022-06-29 11:25:59.436281+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.270Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4b40ff33-ee93-4016-9466-c16f58bedbf4	2022-06-29 11:25:59.537658+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.481Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
55634f12-d960-434f-887c-839280da1e0f	2022-06-29 11:25:59.5444+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.478Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
726858a3-1981-4834-a39b-ed31bd273f64	2022-06-29 11:25:59.563744+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.516Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
10e783db-874b-438e-9f14-80d08826762b	2022-06-29 11:25:59.692737+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.595Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
25cafc3d-8db5-465a-b128-70a29b29596e	2022-06-29 11:25:59.703812+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.634Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f15d275d-8a8b-4c23-92de-328c9692f84d	2022-06-29 11:25:59.721678+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.648Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ac0f4b4c-1a13-439a-9606-4c68b9d8099d	2022-06-29 11:25:59.82923+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T11:25:59.764Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c23caeb5-749a-41f1-9afc-d7f7063405aa	2022-06-29 11:25:59.943046+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.785Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6b44d676-2c85-4be9-b3e0-94db70ba54ea	2022-06-29 11:25:59.989939+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:25:59.792Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
43471261-ab31-4736-a239-7bdafe573b95	2022-06-29 11:26:00.403688+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:26:00.198Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6e8aecdb-ceb4-4ecf-9341-aea347d475ae	2022-06-29 11:26:00.524167+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:26:00.513Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:25:58.097", "compliance_last_success_date": "2022-06-29T11:25:58.097"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
277d949a-f19d-4ca6-b62c-836db3b4b431	2022-06-29 11:26:00.078322+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:26:00.050Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1e174c34-588c-4ddf-8f11-1044292771b7	2022-06-29 11:26:00.329406+00	admin	5df1d159-5810-4297-ba94-afb2d1a277d4	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:26:00.256Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:25:58.097", "compliance_last_success_date": "2022-06-29T11:25:58.097"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
fd6b4608-0990-4426-aebf-41d8d7b14029	2022-06-29 11:29:19.251227+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:29:19.161Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:29:18.085", "compliance_last_success_date": "2022-06-29T11:25:58.097Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3dc26696-ac10-46ff-b2fa-31d107d6b550	2022-06-29 11:29:19.2631+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:29:19.157Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:29:18.085", "compliance_last_success_date": "2022-06-29T11:13:51.775Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
a69ed538-3643-4452-bf90-6444fb1fac68	2022-06-29 11:29:19.276587+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:29:19.145Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:29:18.085", "compliance_last_success_date": "2022-06-29T11:25:58.097Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3116ba10-fa2c-468e-9d36-c1bcf0fd12b9	2022-06-29 11:29:19.544593+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.423Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
62057fa3-0eca-4593-99d7-94d8d8dcd9d3	2022-06-29 11:29:19.556209+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.395Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
291a48fc-c1ea-4ea2-b421-07bf9dde918e	2022-06-29 11:29:19.563828+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.408Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ef2260a2-0261-4dbe-84cb-2b7e52ad7c64	2022-06-29 11:29:19.827557+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.657Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
bf0bff47-8714-4b85-93c9-c29a80757538	2022-06-29 11:29:19.860111+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.690Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
dadb05e2-7346-423e-85b9-824ed525e4a9	2022-06-29 11:29:19.873187+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.687Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f5aa3339-0422-4af4-a5de-6b71929b9ded	2022-06-29 11:29:19.98394+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.916Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
74167589-f6e8-4293-98ee-10007b631193	2022-06-29 11:29:19.995345+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.947Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3cb33593-a0cc-4e1d-b0a3-f35500ae6a26	2022-06-29 11:29:20.009771+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:19.956Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6d296bc8-b342-456f-a024-bf32e1b4687b	2022-06-29 11:29:20.166783+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T11:29:20.089Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
bf2d96f4-245e-4660-9db7-59baa38f7881	2022-06-29 11:29:20.167881+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:20.099Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
636ec8c0-0de0-4686-8d06-a3a073a4bbec	2022-06-29 11:29:20.169437+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:20.098Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
834c014d-bcf3-431b-a4bd-cda9cbb6b6f1	2022-06-29 11:29:20.428457+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:20.311Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ac185b8f-c70f-4888-a027-d8e93bbf5f89	2022-06-29 11:29:20.485063+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:29:20.458Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:29:18.085", "compliance_last_success_date": "2022-06-29T11:29:18.085"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
716f371c-3175-4eee-931e-8086b13f7e78	2022-06-29 11:29:20.42987+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:20.331Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4fbbe278-881f-45a0-b84d-fa229047d466	2022-06-29 11:29:20.523749+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:29:20.477Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:29:18.085", "compliance_last_success_date": "2022-06-29T11:29:18.085"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3e2d8cc3-87e1-495f-a154-966ed74896f0	2022-06-29 11:29:20.431543+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:29:20.324Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
ad94bb2b-ac14-4f89-90af-c671b1b1133c	2022-06-29 11:29:20.504405+00	admin	7060ad4b-c7c0-4a8c-b029-5776bb4f7cf5	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:29:20.467Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:29:18.085", "compliance_last_success_date": "2022-06-29T11:29:18.085"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c89b6e1f-d575-47ac-a27c-a581a03f4a59	2022-06-29 11:35:14.257084+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:35:14.170Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:35:13.182", "compliance_last_success_date": "2022-06-29T11:29:18.085Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
1a261355-6ac0-4aae-9b25-ea6ebca854c4	2022-06-29 11:35:14.2591+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:35:14.166Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:35:13.182", "compliance_last_success_date": "2022-06-29T11:29:18.085Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5265bf9a-0a0e-49c9-bee0-9439b7ca19fb	2022-06-29 11:35:14.260053+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:35:14.214Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:35:13.182", "compliance_last_success_date": "2022-06-29T11:29:18.085Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
de5b253c-6f7b-4458-abcd-74b33b67ac3e	2022-06-29 11:35:14.554394+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.359Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e9d63280-b9ff-435a-94be-64fb04e57c5c	2022-06-29 11:35:14.5629+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.356Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7080bc3d-877d-4549-9c05-0339fa63f4c7	2022-06-29 11:35:14.57199+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.361Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
d7e243e6-414b-45de-b320-470ea363824e	2022-06-29 11:35:14.738124+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.647Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
aff137e5-b906-40bb-a008-4bdf614a9fc7	2022-06-29 11:35:14.805213+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.671Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
65053dde-163d-431b-871d-2a451f71edaa	2022-06-29 11:35:14.824873+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.705Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f1b4ee30-0f97-4204-9f35-8bd875bd59f3	2022-06-29 11:35:14.939774+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.845Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
34ad79eb-9c99-45a6-b746-e8e2aa722c10	2022-06-29 11:35:15.003444+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.892Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2640b0f4-78cb-45d0-8107-76f19a6ae73f	2022-06-29 11:35:15.172099+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:14.914Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
45f9cbe1-5ac5-4707-aeaf-9b5dfaf9fa65	2022-06-29 11:35:15.356244+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T11:35:15.199Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
57c1ed58-37da-47bd-ac9e-ae5f6758d883	2022-06-29 11:35:15.380571+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:15.272Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6d25b94b-c1cf-4c02-abed-d85bbbd9b0c7	2022-06-29 11:35:15.383758+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:15.286Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
276d1d45-634b-405a-9aaf-64e3aa0b1b89	2022-06-29 11:35:15.69563+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:15.540Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c60357a1-13ad-4075-896f-11319ecb94f6	2022-06-29 11:35:15.755608+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:35:15.736Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:35:13.182", "compliance_last_success_date": "2022-06-29T11:35:13.182"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9c4951a3-2a8e-4e05-9137-9feee92bdeb8	2022-06-29 11:35:15.563806+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:15.497Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
fe680525-d10b-411f-b5e9-9a64a14356ec	2022-06-29 11:35:15.73542+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:35:15.707Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:35:13.182", "compliance_last_success_date": "2022-06-29T11:35:13.182"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
b639f58b-5cc0-4386-8778-300f7c5f788a	2022-06-29 11:35:15.577187+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:35:15.501Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
86d8b09b-186f-43c4-8375-4c690d5a3386	2022-06-29 11:35:15.756858+00	admin	4f407682-fd4a-498a-846b-b2c0c1314244	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:35:15.740Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:35:13.182", "compliance_last_success_date": "2022-06-29T11:35:13.182"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
fa5c66f4-93a0-42b7-ae4d-f8fd45acd384	2022-06-29 11:44:50.043214+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:44:49.940Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:44:48.676", "compliance_last_success_date": "2022-06-29T11:35:13.182Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9795c0c0-1abb-49c7-9d77-2a562302bd06	2022-06-29 11:44:50.046527+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:44:49.979Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:44:48.676", "compliance_last_success_date": "2022-06-29T11:35:13.182Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2081b263-81ce-470c-a7fe-b6e42a0d2659	2022-06-29 11:44:50.051868+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:44:49.960Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:44:48.676", "compliance_last_success_date": "2022-06-29T11:35:13.182Z"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
e5a47799-a4a8-435c-ab23-56684c004047	2022-06-29 11:44:50.199712+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	37adbe0e-425e-4926-bb63-c9b56e515881	\N	clab-basic-R2 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.121Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
3c662ec7-1eef-4a59-a8c2-46a08b8da43c	2022-06-29 11:44:50.202532+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	dcab9ec2-a89d-4daa-bea3-6a3624a24966	\N	clab-basic-R1 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.126Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
08a3737b-0233-436a-8502-dfcb232c19b0	2022-06-29 11:44:50.203873+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	82ea7585-4922-4bf5-b1a1-9d21cf64a677	\N	clab-basic-R3 -> Arista EOS - aaa -> True	{"rule": "fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.127Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
6f02261b-ed4f-4675-a466-23dc26d3c995	2022-06-29 11:44:50.333926+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	f5e45fb2-3604-474c-9177-6a23269535ac	\N	clab-basic-R2 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.272Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
4da40136-98f1-4a45-b8b8-00786ceb3f65	2022-06-29 11:44:50.367179+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	\N	clab-basic-R3 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.277Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c5be9667-9e6a-4d97-a414-56aacb4433fe	2022-06-29 11:44:50.447784+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	b47fbd77-4867-4b76-88e1-a3d715ae5f5e	\N	clab-basic-R1 -> Arista EOS - dns -> True	{"rule": "34004af9-18b2-4e17-aebd-dc23cc972a96", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.302Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
5939353d-7341-4d90-bb84-562778723b70	2022-06-29 11:44:50.620579+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	5a14a428-4a84-4ce6-b358-8e7e84f538ca	\N	clab-basic-R3 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.537Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
60466638-d472-4ef4-98e1-fc374d56d859	2022-06-29 11:44:50.647751+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	904b7fd7-6ba6-465b-bf8b-57326ba77be6	\N	clab-basic-R2 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.536Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
f474d9d1-f638-419b-8a50-a0c2e58f90a0	2022-06-29 11:44:50.651123+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	d9eecb2d-1a5d-4eff-838f-4adb3be6f982	\N	clab-basic-R1 -> Arista EOS - interface -> True	{"rule": "c0bf33e3-f7b5-435d-8b8f-ee2a374a0418", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.545Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
7d078357-11e3-43d4-8a02-a4afe7d53ca1	2022-06-29 11:44:50.845579+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	7815f822-a2b0-4c22-9069-da14cc40b258	\N	clab-basic-R2 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.708Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
67333550-9038-4e94-a979-e776054658c6	2022-06-29 11:44:50.84773+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	aa756f35-61c6-4255-9f70-518940ca279e	\N	clab-basic-R1 -> Arista EOS - ipv6 -> True	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:50.720Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
9a4ace10-9de3-40b3-b00b-4b9dc8a8ee79	2022-06-29 11:44:50.851248+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	\N	clab-basic-R3 -> Arista EOS - ipv6 -> False	{"rule": "7b7ee46b-ce47-4a35-8c68-72b65767903e", "tags": [], "extra": "ipv6 unicast-routing", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": false, "compliance": false, "last_updated": "2022-06-29T11:44:50.716Z", "custom_fields": {}, "compliance_int": 0}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
161771fc-56b3-43e0-b37b-8f8a9603ff00	2022-06-29 11:44:51.141127+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	0fa58959-bbcc-47c3-8413-dcf11cbff383	\N	clab-basic-R3 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:51.101Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
66d1a8d9-9633-407d-9195-cf3e84ef4f99	2022-06-29 11:44:51.219617+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	e04310e3-fa39-485a-8522-d8098e77f027	\N	clab-basic-R3	{"tags": [], "device": "81779b36-7a77-4055-b8e9-6eb98e50bff5", "created": "2022-06-14", "last_updated": "2022-06-29T11:44:51.191Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:44:48.676", "compliance_last_success_date": "2022-06-29T11:44:48.676"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
c5fa8b5a-862b-4373-9f9e-e86269cfbdf2	2022-06-29 11:44:51.124008+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	2195792f-18b9-4740-9584-60d8f96e7a8b	\N	clab-basic-R2 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:51.002Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
2318f879-6aca-44c8-b614-e78b3b0beca0	2022-06-29 11:44:51.201196+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	\N	clab-basic-R2	{"tags": [], "device": "06745599-bc34-41c5-af97-699accfc8ad6", "created": "2022-06-14", "last_updated": "2022-06-29T11:44:51.177Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:44:48.676", "compliance_last_success_date": "2022-06-29T11:44:48.676"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
0d71e929-4691-4e08-8f2f-74f42e5af4b8	2022-06-29 11:44:51.136982+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	01cb36cd-37e6-47dd-9676-f156461448ac	\N	clab-basic-R1 -> Arista EOS - prefix-list -> True	{"rule": "9eef55a6-5038-48bf-8a34-4687c6e233db", "tags": [], "extra": "", "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-29", "missing": "", "ordered": true, "compliance": true, "last_updated": "2022-06-29T11:44:51.071Z", "custom_fields": {}, "compliance_int": 1}	116	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
05235058-4ce0-495c-b5b0-737e3701b4ff	2022-06-29 11:44:51.349598+00	admin	01106eaa-951a-425b-be2c-ea563a5107df	update	e508a3db-0126-42d5-b89a-50cc7c2c5c07	\N	clab-basic-R1	{"tags": [], "device": "774633c5-8876-47c1-b9a7-0af0777d42c5", "created": "2022-06-14", "last_updated": "2022-06-29T11:44:51.235Z", "custom_fields": {}, "backup_last_attempt_date": null, "backup_last_success_date": null, "intended_last_attempt_date": null, "intended_last_success_date": null, "compliance_last_attempt_date": "2022-06-29T11:44:48.676", "compliance_last_success_date": "2022-06-29T11:44:48.676"}	113	\N	a8766f1b-01a6-4f9d-8255-18c77e628b60	\N
\.


--
-- Data for Name: extras_relationship; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_relationship (id, created, last_updated, name, slug, description, type, source_label, source_hidden, source_filter, destination_label, destination_hidden, destination_filter, destination_type_id, source_type_id, advanced_ui) FROM stdin;
fba0a09d-658c-4329-bb4e-b5c25fd6946e	2022-06-14	2022-06-14 20:53:17.535708+00	compliance rule exclusion	compliance_rule_exclusion		many-to-many	Tenant	f	\N	Compliance Rule Exclusion	f	\N	99	111	f
\.


--
-- Data for Name: extras_relationshipassociation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_relationshipassociation (id, source_id, destination_id, destination_type_id, relationship_id, source_type_id) FROM stdin;
193906e2-947e-488e-a8c6-fe190e7b08b7	80bfb542-c7ff-4db8-a38d-2435def2a7b9	d52e9447-b1b4-421b-a49f-a540fa6824e7	99	fba0a09d-658c-4329-bb4e-b5c25fd6946e	111
23e7f520-9770-424c-a1f0-db82a0b90fa1	9eef55a6-5038-48bf-8a34-4687c6e233db	982fa2a9-48aa-4cfa-b911-64acbe5b446c	99	fba0a09d-658c-4329-bb4e-b5c25fd6946e	111
\.


--
-- Data for Name: extras_scheduledjob; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_scheduledjob (id, name, task, job_class, "interval", args, kwargs, queue, one_off, start_time, enabled, last_run_at, total_run_count, date_changed, description, approval_required, approved_at, approved_by_user_id, user_id, job_model_id) FROM stdin;
\.


--
-- Data for Name: extras_scheduledjobs; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_scheduledjobs (ident, last_update) FROM stdin;
\.


--
-- Data for Name: extras_secret; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secret (id, created, last_updated, _custom_field_data, name, slug, description, provider, parameters) FROM stdin;
a63ff8d9-f961-4fc7-949c-bca546b3b2ae	2022-06-29	2022-06-29 09:24:32.876701+00	{}	gh-token	gh-token		environment-variable	{"variable": "GH_TOKEN"}
\.


--
-- Data for Name: extras_secretsgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secretsgroup (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
97962bc2-11fa-4833-9ec5-d1316357b113	2022-06-29	2022-06-29 09:24:54.21013+00	{}	Github	github
\.


--
-- Data for Name: extras_secretsgroupassociation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secretsgroupassociation (id, access_type, secret_type, group_id, secret_id) FROM stdin;
7016d966-e020-44b6-b446-83493251106e	HTTP(S)	token	4efbc58a-1757-47cc-b6d6-bdea3c1f3a14	b5c3651d-aff2-4626-bf64-bbfa092aa12d
023431a4-9fac-4693-94a3-c781bc52a82c	HTTP(S)	token	97962bc2-11fa-4833-9ec5-d1316357b113	a63ff8d9-f961-4fc7-949c-bca546b3b2ae
\.


--
-- Data for Name: extras_status; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_status (id, created, last_updated, _custom_field_data, name, color, slug, description) FROM stdin;
107138bd-9550-4ce5-8a89-0f6b3c90d1b6	2022-06-14	2022-06-14 09:07:32.97891+00	{}	Offline	ffc107	offline	Unit is offline
588f4497-9c19-412f-8a41-d8c877e8b863	2022-06-14	2022-06-14 09:07:32.988837+00	{}	Active	4caf50	active	Unit is active
580d1fd0-41fa-4364-b851-5396e6bedc4f	2022-06-14	2022-06-14 09:07:32.996518+00	{}	Planned	00bcd4	planned	Unit has been planned
2c9994df-8854-4103-84d6-b5966e2666b1	2022-06-14	2022-06-14 09:07:33.007286+00	{}	Staged	2196f3	staged	Unit has been staged
4de29681-d064-4d21-a641-9304a5b472b5	2022-06-14	2022-06-14 09:07:33.017076+00	{}	Failed	f44336	failed	Unit has failed
181158c7-7781-4881-b2ce-6fbcd9d7c8cc	2022-06-14	2022-06-14 09:07:33.02335+00	{}	Inventory	9e9e9e	inventory	Device is in inventory
ced3a011-b42c-4c01-94e9-4c8ee41f3796	2022-06-14	2022-06-14 09:07:33.029195+00	{}	Decommissioning	ffc107	decommissioning	Unit is being decommissioned
c94734bf-4740-4763-a270-915c636ab887	2022-06-14	2022-06-14 09:07:33.045264+00	{}	Staging	2196f3	staging	Site is in the process of being staged
23d89591-30f0-459f-ab2e-1a3d5afb427e	2022-06-14	2022-06-14 09:07:33.069267+00	{}	Retired	f44336	retired	Site has been retired
675b7971-c425-45e4-93b8-1c640aebdb68	2022-06-14	2022-06-14 09:07:33.07943+00	{}	Reserved	ffc107	reserved	Unit is reserved
febf99ed-9240-49c1-951e-6ab93f53d7dc	2022-06-14	2022-06-14 09:07:33.085526+00	{}	Available	4caf50	available	Unit is available
3f7d9f31-2beb-46fa-8289-23bff111b61b	2022-06-14	2022-06-14 09:07:33.107708+00	{}	Deprecated	f44336	deprecated	Unit has been deprecated
99f00ab4-bb0b-4c0d-863d-931617f8fe93	2022-06-14	2022-06-14 09:07:33.11771+00	{}	Connected	4caf50	connected	Cable is connected
a3886837-bf4e-4047-a41d-ea815588ee1c	2022-06-14	2022-06-14 09:07:33.168962+00	{}	Provisioning	2196f3	provisioning	Circuit is being provisioned
b57e9ef3-2b8b-437b-b8c5-dd8855783b62	2022-06-14	2022-06-14 09:07:33.188829+00	{}	Deprovisioning	ffc107	deprovisioning	Circuit is being deprovisioned
5ea16baa-f925-40de-bd3d-725267f6c76f	2022-06-14	2022-06-14 09:07:33.194918+00	{}	Decommissioned	9e9e9e	decommissioned	Circuit has been decommissioned
be5e5cad-cfd2-41f3-a11d-9c112a7ad2a0	2022-06-14	2022-06-14 09:07:33.205396+00	{}	Container	9e9e9e	container	Network contains children
7e4f1f23-3a12-4078-ab3f-5b95ce4bc7cb	2022-06-14	2022-06-14 09:07:33.260103+00	{}	DHCP	4caf50	dhcp	Dynamically assigned IPv4/IPv6 address
05e97be1-0f2c-4dce-81f1-b009594a432a	2022-06-14	2022-06-14 09:07:33.265873+00	{}	SLAAC	4caf50	slaac	Dynamically assigned IPv6 address
\.


--
-- Data for Name: extras_status_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_status_content_types (id, status_id, contenttype_id) FROM stdin;
1	107138bd-9550-4ce5-8a89-0f6b3c90d1b6	1
2	588f4497-9c19-412f-8a41-d8c877e8b863	1
3	580d1fd0-41fa-4364-b851-5396e6bedc4f	1
4	2c9994df-8854-4103-84d6-b5966e2666b1	1
5	4de29681-d064-4d21-a641-9304a5b472b5	1
6	181158c7-7781-4881-b2ce-6fbcd9d7c8cc	1
7	ced3a011-b42c-4c01-94e9-4c8ee41f3796	1
8	580d1fd0-41fa-4364-b851-5396e6bedc4f	2
9	c94734bf-4740-4763-a270-915c636ab887	2
10	588f4497-9c19-412f-8a41-d8c877e8b863	2
11	ced3a011-b42c-4c01-94e9-4c8ee41f3796	2
12	23d89591-30f0-459f-ab2e-1a3d5afb427e	2
13	675b7971-c425-45e4-93b8-1c640aebdb68	3
14	febf99ed-9240-49c1-951e-6ab93f53d7dc	3
15	580d1fd0-41fa-4364-b851-5396e6bedc4f	3
16	588f4497-9c19-412f-8a41-d8c877e8b863	3
17	3f7d9f31-2beb-46fa-8289-23bff111b61b	3
18	99f00ab4-bb0b-4c0d-863d-931617f8fe93	4
19	580d1fd0-41fa-4364-b851-5396e6bedc4f	4
20	ced3a011-b42c-4c01-94e9-4c8ee41f3796	4
21	107138bd-9550-4ce5-8a89-0f6b3c90d1b6	5
22	588f4497-9c19-412f-8a41-d8c877e8b863	5
23	580d1fd0-41fa-4364-b851-5396e6bedc4f	5
24	4de29681-d064-4d21-a641-9304a5b472b5	5
25	580d1fd0-41fa-4364-b851-5396e6bedc4f	6
26	a3886837-bf4e-4047-a41d-ea815588ee1c	6
27	588f4497-9c19-412f-8a41-d8c877e8b863	6
28	107138bd-9550-4ce5-8a89-0f6b3c90d1b6	6
29	b57e9ef3-2b8b-437b-b8c5-dd8855783b62	6
30	5ea16baa-f925-40de-bd3d-725267f6c76f	6
31	be5e5cad-cfd2-41f3-a11d-9c112a7ad2a0	7
32	588f4497-9c19-412f-8a41-d8c877e8b863	7
33	675b7971-c425-45e4-93b8-1c640aebdb68	7
34	3f7d9f31-2beb-46fa-8289-23bff111b61b	7
35	588f4497-9c19-412f-8a41-d8c877e8b863	8
36	675b7971-c425-45e4-93b8-1c640aebdb68	8
37	3f7d9f31-2beb-46fa-8289-23bff111b61b	8
38	7e4f1f23-3a12-4078-ab3f-5b95ce4bc7cb	8
39	05e97be1-0f2c-4dce-81f1-b009594a432a	8
40	588f4497-9c19-412f-8a41-d8c877e8b863	9
41	675b7971-c425-45e4-93b8-1c640aebdb68	9
42	3f7d9f31-2beb-46fa-8289-23bff111b61b	9
43	107138bd-9550-4ce5-8a89-0f6b3c90d1b6	10
44	588f4497-9c19-412f-8a41-d8c877e8b863	10
45	580d1fd0-41fa-4364-b851-5396e6bedc4f	10
46	2c9994df-8854-4103-84d6-b5966e2666b1	10
47	4de29681-d064-4d21-a641-9304a5b472b5	10
48	ced3a011-b42c-4c01-94e9-4c8ee41f3796	10
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_tag (name, slug, id, created, last_updated, _custom_field_data, color, description) FROM stdin;
\.


--
-- Data for Name: extras_tag_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_tag_content_types (id, tag_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_webhook (id, created, last_updated, name, type_create, type_update, type_delete, payload_url, enabled, http_method, http_content_type, additional_headers, body_template, secret, ssl_verification, ca_file_path) FROM stdin;
\.


--
-- Data for Name: extras_webhook_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_webhook_content_types (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_aggregate (id, created, last_updated, _custom_field_data, network, broadcast, prefix_length, date_added, description, rir_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_ipaddress (id, created, last_updated, _custom_field_data, host, broadcast, prefix_length, role, assigned_object_id, dns_name, description, assigned_object_type_id, nat_inside_id, status_id, tenant_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_prefix (id, created, last_updated, _custom_field_data, network, broadcast, prefix_length, is_pool, description, role_id, site_id, status_id, tenant_id, vlan_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_rir (id, created, last_updated, _custom_field_data, name, slug, is_private, description) FROM stdin;
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_role (id, created, last_updated, _custom_field_data, name, slug, weight, description) FROM stdin;
\.


--
-- Data for Name: ipam_routetarget; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_routetarget (id, created, last_updated, _custom_field_data, name, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_service (id, created, last_updated, _custom_field_data, name, protocol, ports, description, device_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vlan (id, created, last_updated, _custom_field_data, vid, name, description, group_id, role_id, site_id, status_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vlangroup (id, created, last_updated, _custom_field_data, name, slug, description, site_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrf (id, created, last_updated, _custom_field_data, name, rd, enforce_unique, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_export_targets; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrf_export_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_import_targets; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrf_import_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: nautobot_golden_config_compliancefeature; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.nautobot_golden_config_compliancefeature (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
5a370232-3ef5-4d31-98d7-1067fc843027	2022-06-29	2022-06-29 09:28:59.307683+00	{}	aaa	aaa
7b582f67-5686-487f-ad4c-ef53a16e6526	2022-06-29	2022-06-29 09:29:16.628394+00	{}	dns	dns
a2b1ca21-850a-4809-8983-1393c9286b29	2022-06-29	2022-06-29 09:29:28.083839+00	{}	interface	interface
99a176f0-dc0c-45b8-8c4d-d7381ad7c3a3	2022-06-29	2022-06-29 09:29:33.434406+00	{}	ipv6	ipv6
5864c7f3-17c3-4b3f-acd1-219856b03ddb	2022-06-29	2022-06-29 09:29:40.078231+00	{}	prefix-list	prefix-list
\.


--
-- Data for Name: nautobot_golden_config_compliancerule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.nautobot_golden_config_compliancerule (id, created, last_updated, _custom_field_data, description, config_ordered, match_config, config_type, feature_id, platform_id) FROM stdin;
80bfb542-c7ff-4db8-a38d-2435def2a7b9	2022-06-14	2022-06-14 09:51:06.406629+00	{}		f	ipv6	cli	9c2d2d8d-1ebd-4c64-84b4-d1984c36569b	75bcfef4-6eb4-44a5-bc8e-558e70e44978
f8f0a8af-6bf9-438b-ab08-ba18dcff5b4c	2022-06-14	2022-06-14 09:51:22.684307+00	{}		f	aaa\r\nno aaa\r\nmanagement\r\nusername\r\nrole\r\nradius-server	cli	6e139e4c-12bd-4bd3-ab50-50fce2f1f36c	75bcfef4-6eb4-44a5-bc8e-558e70e44978
8adf858e-c6b7-43b0-95c3-ba5a2cebf852	2022-06-14	2022-06-14 09:51:49.137799+00	{}		f	ip domain\r\ndns domain	cli	398c32e8-0038-4855-a121-95c198e37b77	75bcfef4-6eb4-44a5-bc8e-558e70e44978
fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2	2022-06-29	2022-06-29 09:30:09.852794+00	{}		f	aaa\r\nno aaa\r\nmanagement\r\nusername\r\nrole\r\nradius-server	cli	5a370232-3ef5-4d31-98d7-1067fc843027	50e0618d-c01a-464d-bb31-002e3c39d0ed
34004af9-18b2-4e17-aebd-dc23cc972a96	2022-06-29	2022-06-29 09:30:33.589455+00	{}		f	ip domain\r\ndns domain	cli	7b582f67-5686-487f-ad4c-ef53a16e6526	50e0618d-c01a-464d-bb31-002e3c39d0ed
c0bf33e3-f7b5-435d-8b8f-ee2a374a0418	2022-06-29	2022-06-29 09:30:55.145587+00	{}		f	interface	cli	a2b1ca21-850a-4809-8983-1393c9286b29	50e0618d-c01a-464d-bb31-002e3c39d0ed
7b7ee46b-ce47-4a35-8c68-72b65767903e	2022-06-29	2022-06-29 09:31:05.731502+00	{}		f	ipv6	cli	99a176f0-dc0c-45b8-8c4d-d7381ad7c3a3	50e0618d-c01a-464d-bb31-002e3c39d0ed
9eef55a6-5038-48bf-8a34-4687c6e233db	2022-06-29	2022-06-29 11:07:35.207375+00	{}		f	ip prefix-list	custom	5864c7f3-17c3-4b3f-acd1-219856b03ddb	50e0618d-c01a-464d-bb31-002e3c39d0ed
\.


--
-- Data for Name: nautobot_golden_config_configcompliance; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.nautobot_golden_config_configcompliance (id, created, last_updated, _custom_field_data, compliance, actual, intended, missing, extra, ordered, compliance_int, device_id, rule_id) FROM stdin;
dcab9ec2-a89d-4daa-bea3-6a3624a24966	2022-06-29	2022-06-29 11:44:50.126116+00	{}	t	"no aaa root\\nusername admin privilege 15 role network-admin secret sha512\\nmanagement api http-commands\\n   no shutdown\\nmanagement api gnmi\\n   transport grpc default\\nmanagement api netconf\\n   transport ssh default"	"no aaa root\\nusername admin privilege 15 role network-admin secret sha512\\nmanagement api http-commands\\n   no shutdown\\nmanagement api gnmi\\n   transport grpc default\\nmanagement api netconf\\n   transport ssh default"	""	""	t	1	774633c5-8876-47c1-b9a7-0af0777d42c5	fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2
82ea7585-4922-4bf5-b1a1-9d21cf64a677	2022-06-29	2022-06-29 11:44:50.127004+00	{}	t	"no aaa root\\nusername admin privilege 15 role network-admin secret sha512\\nmanagement api http-commands\\n   no shutdown\\nmanagement api gnmi\\n   transport grpc default\\nmanagement api netconf\\n   transport ssh default"	"no aaa root\\nusername admin privilege 15 role network-admin secret sha512\\nmanagement api http-commands\\n   no shutdown\\nmanagement api gnmi\\n   transport grpc default\\nmanagement api netconf\\n   transport ssh default"	""	""	t	1	81779b36-7a77-4055-b8e9-6eb98e50bff5	fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2
f5e45fb2-3604-474c-9177-6a23269535ac	2022-06-29	2022-06-29 11:44:50.272683+00	{}	t	""	""	""	""	t1	06745599-bc34-41c5-af97-699accfc8ad6	34004af9-18b2-4e17-aebd-dc23cc972a96
772bc0c2-73cb-4ce1-862c-8ebdaec5ed6c	2022-06-29	2022-06-29 11:44:50.277384+00	{}	t	""	""	""	""	t1	81779b36-7a77-4055-b8e9-6eb98e50bff5	34004af9-18b2-4e17-aebd-dc23cc972a96
b47fbd77-4867-4b76-88e1-a3d715ae5f5e	2022-06-29	2022-06-29 11:44:50.302198+00	{}	t	""	""	""	""	t1	774633c5-8876-47c1-b9a7-0af0777d42c5	34004af9-18b2-4e17-aebd-dc23cc972a96
7815f822-a2b0-4c22-9069-da14cc40b258	2022-06-29	2022-06-29 11:44:50.708121+00	{}	t	"ipv6 unicast-routing"	"ipv6 unicast-routing"	""	""	t	1	06745599-bc34-41c5-af97-699accfc8ad6	7b7ee46b-ce47-4a35-8c68-72b65767903e
37adbe0e-425e-4926-bb63-c9b56e515881	2022-06-29	2022-06-29 11:44:50.121164+00	{}	t	"no aaa root\\nusername admin privilege 15 role network-admin secret sha512\\nmanagement api http-commands\\n   no shutdown\\nmanagement api gnmi\\n   transport grpc default\\nmanagement api netconf\\n   transport ssh default"	"no aaa root\\nusername admin privilege 15 role network-admin secret sha512\\nmanagement api http-commands\\n   no shutdown\\nmanagement api gnmi\\n   transport grpc default\\nmanagement api netconf\\n   transport ssh default"	""	""	t	1	06745599-bc34-41c5-af97-699accfc8ad6	fac211b6-2309-4a8d-aa1b-bfd3dc70e7b2
f17a4c00-1523-4a2e-8f72-0c93a8aa41a6	2022-06-29	2022-06-29 11:44:50.716075+00	{}	f	"ipv6 unicast-routing"	""	""	"ipv6 unicast-routing"	f	0	81779b36-7a77-4055-b8e9-6eb98e50bff5	7b7ee46b-ce47-4a35-8c68-72b65767903e
aa756f35-61c6-4255-9f70-518940ca279e	2022-06-29	2022-06-29 11:44:50.720262+00	{}	t	"ipv6 unicast-routing"	"ipv6 unicast-routing"	""	""	t	1	774633c5-8876-47c1-b9a7-0af0777d42c5	7b7ee46b-ce47-4a35-8c68-72b65767903e
0fa58959-bbcc-47c3-8413-dcf11cbff383	2022-06-29	2022-06-29 11:44:51.10147+00	{}	t	""	""	""	""	t1	81779b36-7a77-4055-b8e9-6eb98e50bff5	9eef55a6-5038-48bf-8a34-4687c6e233db
2195792f-18b9-4740-9584-60d8f96e7a8b	2022-06-29	2022-06-29 11:44:51.002227+00	{}	t	"ip prefix-list loopback\\n   seq 10 permit 1.1.1.11/32\\n   seq 20 permit 1.1.1.12/32\\n   seq 30 permit 1.1.1.22/32\\n   seq 40 permit 1.1.1.21/32\\n   seq 50 permit 2.2.2.1/32\\n   seq 60 permit 2.2.2.2/32"	"ip prefix-list loopback\\n   seq 10 permit 1.1.1.11/32\\n   seq 20 permit 1.1.1.12/32\\n   seq 30 permit 1.1.1.22/32\\n   seq 40 permit 1.1.1.21/32"	""	""	t	1	06745599-bc34-41c5-af97-699accfc8ad6	9eef55a6-5038-48bf-8a34-4687c6e233db
01cb36cd-37e6-47dd-9676-f156461448ac	2022-06-29	2022-06-29 11:44:51.071078+00	{}	t	""	""	""	""	t1	774633c5-8876-47c1-b9a7-0af0777d42c5	9eef55a6-5038-48bf-8a34-4687c6e233db
5a14a428-4a84-4ce6-b358-8e7e84f538ca	2022-06-29	2022-06-29 11:44:50.537318+00	{}	t	"interface Ethernet1\\n   description R3 -> R2\\n   mac-address 52:dc:ca:fe:03:01\\n   no switchport\\n   ip address 10.1.0.6/30\\n   ipv6 enable\\ninterface Loopback0\\n   ip address 10.0.0.3/32\\n   ipv6 address 200:0:0:3::1/64\\ninterface Management0\\n   ip address 172.20.20.4/24\\n   ipv6 address 2001:172:20:20::4/64\\n   no lldp transmit\\n   no lldp receive"	"interface Ethernet1\\n   description R3 -> R2\\n   mac-address 52:dc:ca:fe:03:01\\n   no switchport\\n   ip address 10.1.0.6/30\\n   ipv6 enable\\ninterface Loopback0\\n   ip address 10.0.0.3/32\\n   ipv6 address 200:0:0:3::1/64\\ninterface Management0\\n   ip address 172.20.20.4/24\\n   ipv6 address 2001:172:20:20::4/64\\n   no lldp transmit\\n   no lldp receive"	""	""	t	1	81779b36-7a77-4055-b8e9-6eb98e50bff5	c0bf33e3-f7b5-435d-8b8f-ee2a374a0418
d9eecb2d-1a5d-4eff-838f-4adb3be6f982	2022-06-29	2022-06-29 11:44:50.54538+00	{}	t	"interface Ethernet1\\n   description R1 -> R2\\n   mac-address 52:dc:ca:fe:01:01\\n   no switchport\\n   ip address 10.1.0.1/30\\n   ipv6 enable\\ninterface Loopback0\\n   ip address 10.0.0.1/32\\n   ipv6 address 200:0:0:1::1/64\\ninterface Management0\\n   ip address 172.20.20.3/24\\n   ipv6 address 2001:172:20:20::3/64\\n   no lldp transmit\\n   no lldp receive"	"interface Ethernet1\\n   description R1 -> R2\\n   mac-address 52:dc:ca:fe:01:01\\n   no switchport\\n   ip address 10.1.0.1/30\\n   ipv6 enable\\ninterface Loopback0\\n   ip address 10.0.0.1/32\\n   ipv6 address 200:0:0:1::1/64\\ninterface Management0\\n   ip address 172.20.20.3/24\\n   ipv6 address 2001:172:20:20::3/64\\n   no lldp transmit\\n   no lldp receive"	""	""	t	1	774633c5-8876-47c1-b9a7-0af0777d42c5	c0bf33e3-f7b5-435d-8b8f-ee2a374a0418
904b7fd7-6ba6-465b-bf8b-57326ba77be6	2022-06-29	2022-06-29 11:44:50.536238+00	{}	t	"interface Ethernet1\\n   description R2 -> R1\\n   mac-address 52:dc:ca:fe:02:01\\n   no switchport\\n   ip address 10.1.0.2/30\\n   ipv6 enable\\ninterface Ethernet2\\n   description R2 -> R3\\n   mac-address 52:dc:ca:fe:02:02\\n   no switchport\\n   ip address 10.1.0.5/30\\n   ipv6 enable\\ninterface Loopback0\\n   ip address 10.0.0.2/32\\n   ipv6 address 200:0:0:2::1/64\\ninterface Management0\\n   ip address 172.20.20.2/24\\n   ipv6 address 2001:172:20:20::2/64\\n   no lldp transmit\\n   no lldp receive"	"interface Ethernet1\\n   description R2 -> R1\\n   mac-address 52:dc:ca:fe:02:01\\n   no switchport\\n   ip address 10.1.0.2/30\\n   ipv6 enable\\ninterface Ethernet2\\n   description R2 -> R3\\n   mac-address 52:dc:ca:fe:02:02\\n   no switchport\\n   ip address 10.1.0.5/30\\n   ipv6 enable\\ninterface Loopback0\\n   ip address 10.0.0.2/32\\n   ipv6 address 200:0:0:2::1/64\\ninterface Management0\\n   ip address 172.20.20.2/24\\n   ipv6 address 2001:172:20:20::2/64\\n   no lldp transmit\\n   no lldp receive"	""	""	t	1	06745599-bc34-41c5-af97-699accfc8ad6	c0bf33e3-f7b5-435d-8b8f-ee2a374a0418
\.


--
-- Data for Name: nautobot_golden_config_configremove; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.nautobot_golden_config_configremove (id, created, last_updated, _custom_field_data, name, description, regex, platform_id) FROM stdin;
\.


--
-- Data for Name: nautobot_golden_config_configreplace; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.nautobot_golden_config_configreplace (id, created, last_updated, _custom_field_data, name, description, regex, replace, platform_id) FROM stdin;
\.


--
-- Data for Name: nautobot_golden_config_goldenconfig; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.nautobot_golden_config_goldenconfig (id, created, last_updated, _custom_field_data, backup_config, backup_last_attempt_date, backup_last_success_date, intended_config, intended_last_attempt_date, intended_last_success_date, compliance_config, compliance_last_attempt_date, compliance_last_success_date, device_id) FROM stdin;
3bda8e9c-209a-4bb6-ac2c-127f1c1a0c53	2022-06-14	2022-06-29 11:44:51.177483+00	{}		\N	\N		\N	\N	--- \n+++ \n@@ -48,16 +48,11 @@\n    no lldp transmit\n\n    no lldp receive\n\n !\n\n-route-map dont_advertise_loopbacks deny 10\n\n-   match ip address prefix-list loopback\n\n-!\n\n ip prefix-list loopback\n\n    seq 10 permit 1.1.1.11/32\n\n    seq 20 permit 1.1.1.12/32\n\n    seq 30 permit 1.1.1.22/32\n\n    seq 40 permit 1.1.1.21/32\n\n-   seq 50 permit 2.2.2.1/32\n\n-   seq 60 permit 2.2.2.2/32\n\n !\n\n ip routing\n\n !\n	2022-06-29 11:44:48.676098+00	2022-06-29 11:44:48.676098+00	06745599-bc34-41c5-af97-699accfc8ad6
e04310e3-fa39-485a-8522-d8098e77f027	2022-06-14	2022-06-29 11:44:51.191493+00	{}		\N	\N		\N	\N	--- \n+++ \n@@ -43,6 +43,4 @@\n !\n\n ip routing\n\n !\n\n-ipv6 unicast-routing\n\n-!\n\n end\n	2022-06-29 11:44:48.676098+00	2022-06-29 11:44:48.676098+00	81779b36-7a77-4055-b8e9-6eb98e50bff5
e508a3db-0126-42d5-b89a-50cc7c2c5c07	2022-06-14	2022-06-29 11:44:51.235159+00	{}		\N	\N		\N	\N		2022-06-29 11:44:48.676098+00	2022-06-29 11:44:48.676098+00	774633c5-8876-47c1-b9a7-0af0777d42c5
\.


--
-- Data for Name: nautobot_golden_config_goldenconfigsetting; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.nautobot_golden_config_goldenconfigsetting (id, created, last_updated, _custom_field_data, backup_path_template, intended_path_template, jinja_path_template, backup_test_connectivity, scope, jinja_repository_id, description, name, slug, weight, backup_repository_id, intended_repository_id, sot_agg_query_id) FROM stdin;
b314780e-c74e-4670-bbb1-891ebf522b00	2022-06-14	2022-06-14 15:24:25.19602+00	{}	{{obj.site.slug}}/{{obj.name}}.cfg	{{obj.site.slug}}/{{obj.name}}.cfg		t	{"platform": ["arista_eos"]}	\N		Default Settings	default	1000	3f5dabb2-61ef-4977-aaff-08fb7e7520fa	54515f59-dcf1-419a-b0be-76474be05ebe	\N
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.tenancy_tenant (id, created, last_updated, _custom_field_data, name, slug, description, comments, group_id) FROM stdin;
32c17dc0-cb64-40b7-a09f-e40f91e2c1de	2022-06-29	2022-06-29 09:21:29.175218+00	{}	Converged Cloud	converged-cloud		\N
982fa2a9-48aa-4cfa-b911-64acbe5b446c	2022-06-29	2022-06-29 09:35:34.21662+00	{}	HEK	hek			\N
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.tenancy_tenantgroup (id, created, last_updated, _custom_field_data, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission (id, name, description, enabled, actions, constraints) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission_groups (id, objectpermission_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_object_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission_object_types (id, objectpermission_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_users; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission_users (id, objectpermission_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_cluster (id, created, last_updated, _custom_field_data, name, comments, group_id, site_id, tenant_id, type_id) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_clustergroup (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_clustertype (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_virtualmachine (id, created, last_updated, _custom_field_data, local_context_data, local_context_data_owner_object_id, name, vcpus, memory, disk, comments, cluster_id, local_context_data_owner_content_type_id, platform_id, primary_ip4_id, primary_ip6_id, role_id, status_id, tenant_id, local_context_schema_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_vminterface (id, _custom_field_data, enabled, mac_address, mtu, mode, name, _name, description, untagged_vlan_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_vminterface_tagged_vlans (id, vminterface_id, vlan_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 487, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: constance_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.constance_config_id_seq', 1, true);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 130, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 144, true);


--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_clusters_id_seq', 1, false);


--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_device_types_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_tags_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_customfield_content_types_id_seq', 1, false);


--
-- Name: extras_status_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_status_content_types_id_seq', 48, true);


--
-- Name: extras_tag_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_tag_content_types_id_seq', 1, false);


--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_webhook_content_types_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.ipam_vrf_export_targets_id_seq', 1, false);


--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.ipam_vrf_import_targets_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.users_objectpermission_groups_id_seq', 1, false);


--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.users_objectpermission_object_types_id_seq', 1, false);


--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.users_objectpermission_users_id_seq', 1, false);


--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.virtualization_vminterface_tagged_vlans_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: circuits_providernetwork circuits_providernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_pkey PRIMARY KEY (id);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_id_name_6f6610a0_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_id_name_6f6610a0_uniq UNIQUE (provider_id, name);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_name; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_name UNIQUE (provider_id, name);


--
-- Name: circuits_providernetwork circuits_providernetwork_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_slug_key UNIQUE (slug);


--
-- Name: constance_config constance_config_key_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.constance_config
    ADD CONSTRAINT constance_config_key_key UNIQUE (key);


--
-- Name: constance_config constance_config_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.constance_config
    ADD CONSTRAINT constance_config_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq UNIQUE (termination_a_type_id, termination_a_id);


--
-- Name: dcim_cable dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq UNIQUE (termination_b_type_id, termination_b_id);


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq UNIQUE (origin_type_id, origin_id);


--
-- Name: dcim_cablepath dcim_cablepath_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_site_id_tenant_id_name_93f4f962_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_tenant_id_name_93f4f962_uniq UNIQUE (site_id, tenant_id, name);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_device_id_name_235b7af2_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_name_235b7af2_uniq UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_name_804df4c0_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_name_804df4c0_uniq UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_group_id_facility_id_f16a53ae_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_facility_id_f16a53ae_uniq UNIQUE (group_id, facility_id);


--
-- Name: dcim_rack dcim_rack_group_id_name_846f3826_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_name_846f3826_uniq UNIQUE (group_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_name_c9bd921f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_name_c9bd921f_uniq UNIQUE (site_id, name);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_slug_7fbfd118_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_slug_7fbfd118_uniq UNIQUE (site_id, slug);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_device_id_name_4b14dde6_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_name_4b14dde6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_name_key UNIQUE (name);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_slug_key UNIQUE (slug);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_computedfield extras_computedfield_content_type_id_label_021486c8_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_computedfield
    ADD CONSTRAINT extras_computedfield_content_type_id_label_021486c8_uniq UNIQUE (content_type_id, label);


--
-- Name: extras_computedfield extras_computedfield_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_computedfield
    ADD CONSTRAINT extras_computedfield_pkey PRIMARY KEY (id);


--
-- Name: extras_computedfield extras_computedfield_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_computedfield
    ADD CONSTRAINT extras_computedfield_slug_key UNIQUE (slug);


--
-- Name: extras_configcontext_clusters extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq UNIQUE (configcontext_id, cluster_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq UNIQUE (configcontext_id, clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clusters_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_device_types extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq UNIQUE (configcontext_id, devicetype_id);


--
-- Name: extras_configcontext_device_types extras_configcontext_device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_device_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext extras_configcontext_name_owner_content_type__c289e08f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_owner_content_type__c289e08f_uniq UNIQUE (name, owner_content_type_id, owner_object_id);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq UNIQUE (configcontext_id, tag_id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontextschema extras_configcontextschema_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontextschema
    ADD CONSTRAINT extras_configcontextschema_name_key UNIQUE (name);


--
-- Name: extras_configcontextschema extras_configcontextschema_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontextschema
    ADD CONSTRAINT extras_configcontextschema_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield_content_types extras_customfield_conte_customfield_id_contentty_51136c2b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_conte_customfield_id_contentty_51136c2b_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_content_types extras_customfield_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_field_id_value_f959a108_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_field_id_value_f959a108_uniq UNIQUE (field_id, value);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_dynamicgroup extras_dynamicgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroup
    ADD CONSTRAINT extras_dynamicgroup_name_key UNIQUE (name);


--
-- Name: extras_dynamicgroup extras_dynamicgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroup
    ADD CONSTRAINT extras_dynamicgroup_pkey PRIMARY KEY (id);


--
-- Name: extras_dynamicgroup extras_dynamicgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroup
    ADD CONSTRAINT extras_dynamicgroup_slug_key UNIQUE (slug);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_own_3b6ea31b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_own_3b6ea31b_uniq UNIQUE (content_type_id, name, owner_content_type_id, owner_object_id);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_fileattachment extras_fileattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_fileattachment
    ADD CONSTRAINT extras_fileattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_fileproxy extras_fileproxy_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_fileproxy
    ADD CONSTRAINT extras_fileproxy_pkey PRIMARY KEY (id);


--
-- Name: extras_gitrepository extras_gitrepository_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_gitrepository
    ADD CONSTRAINT extras_gitrepository_name_key UNIQUE (name);


--
-- Name: extras_gitrepository extras_gitrepository_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_gitrepository
    ADD CONSTRAINT extras_gitrepository_pkey PRIMARY KEY (id);


--
-- Name: extras_gitrepository extras_gitrepository_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_gitrepository
    ADD CONSTRAINT extras_gitrepository_slug_key UNIQUE (slug);


--
-- Name: extras_graphqlquery extras_graphqlquery_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_graphqlquery
    ADD CONSTRAINT extras_graphqlquery_name_key UNIQUE (name);


--
-- Name: extras_graphqlquery extras_graphqlquery_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_graphqlquery
    ADD CONSTRAINT extras_graphqlquery_pkey PRIMARY KEY (id);


--
-- Name: extras_graphqlquery extras_graphqlquery_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_graphqlquery
    ADD CONSTRAINT extras_graphqlquery_slug_key UNIQUE (slug);


--
-- Name: extras_healthchecktestmodel extras_healthchecktestmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_healthchecktestmodel
    ADD CONSTRAINT extras_healthchecktestmodel_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_job extras_job_grouping_name_8cbc9328_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_job_grouping_name_8cbc9328_uniq UNIQUE ("grouping", name);


--
-- Name: extras_job extras_job_source_git_repository_id_e6dfe58c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_job_source_git_repository_id_e6dfe58c_uniq UNIQUE (source, git_repository_id, module_name, job_class_name);


--
-- Name: extras_joblogentry extras_joblogentry_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_joblogentry
    ADD CONSTRAINT extras_joblogentry_pkey PRIMARY KEY (id);


--
-- Name: extras_job extras_jobmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_jobmodel_pkey PRIMARY KEY (id);


--
-- Name: extras_job extras_jobmodel_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_jobmodel_slug_key UNIQUE (slug);


--
-- Name: extras_jobresult extras_jobresult_job_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_id_key UNIQUE (job_id);


--
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_relationship extras_relationship_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_name_key UNIQUE (name);


--
-- Name: extras_relationship extras_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_pkey PRIMARY KEY (id);


--
-- Name: extras_relationship extras_relationship_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_slug_key UNIQUE (slug);


--
-- Name: extras_relationshipassociation extras_relationshipassoc_relationship_id_source_t_6826a98b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipassoc_relationship_id_source_t_6826a98b_uniq UNIQUE (relationship_id, source_type_id, source_id, destination_type_id, destination_id);


--
-- Name: extras_relationshipassociation extras_relationshipassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipassociation_pkey PRIMARY KEY (id);


--
-- Name: extras_scheduledjob extras_scheduledjob_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_pkey PRIMARY KEY (id);


--
-- Name: extras_scheduledjobs extras_scheduledjobs_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjobs
    ADD CONSTRAINT extras_scheduledjobs_pkey PRIMARY KEY (ident);


--
-- Name: extras_secret extras_secret_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secret
    ADD CONSTRAINT extras_secret_name_key UNIQUE (name);


--
-- Name: extras_secret extras_secret_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secret
    ADD CONSTRAINT extras_secret_pkey PRIMARY KEY (id);


--
-- Name: extras_secret extras_secret_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secret
    ADD CONSTRAINT extras_secret_slug_key UNIQUE (slug);


--
-- Name: extras_secretsgroup extras_secretsgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroup
    ADD CONSTRAINT extras_secretsgroup_name_key UNIQUE (name);


--
-- Name: extras_secretsgroup extras_secretsgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroup
    ADD CONSTRAINT extras_secretsgroup_pkey PRIMARY KEY (id);


--
-- Name: extras_secretsgroup extras_secretsgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroup
    ADD CONSTRAINT extras_secretsgroup_slug_key UNIQUE (slug);


--
-- Name: extras_secretsgroupassociation extras_secretsgroupassoc_group_id_access_type_sec_1b1e944a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupassoc_group_id_access_type_sec_1b1e944a_uniq UNIQUE (group_id, access_type, secret_type);


--
-- Name: extras_secretsgroupassociation extras_secretsgroupassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupassociation_pkey PRIMARY KEY (id);


--
-- Name: extras_status_content_types extras_status_content_ty_status_id_contenttype_id_423e142c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types
    ADD CONSTRAINT extras_status_content_ty_status_id_contenttype_id_423e142c_uniq UNIQUE (status_id, contenttype_id);


--
-- Name: extras_status_content_types extras_status_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types
    ADD CONSTRAINT extras_status_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_status extras_status_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status
    ADD CONSTRAINT extras_status_name_key UNIQUE (name);


--
-- Name: extras_status extras_status_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status
    ADD CONSTRAINT extras_status_pkey PRIMARY KEY (id);


--
-- Name: extras_status extras_status_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status
    ADD CONSTRAINT extras_status_slug_key UNIQUE (slug);


--
-- Name: extras_tag_content_types extras_tag_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types
    ADD CONSTRAINT extras_tag_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_tag_content_types extras_tag_content_types_tag_id_contenttype_id_726a20d6_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types
    ADD CONSTRAINT extras_tag_content_types_tag_id_contenttype_id_726a20d6_uniq UNIQUE (tag_id, contenttype_id);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_content_types extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook_content_types extras_webhook_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_routetarget ipam_routetarget_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_name_key UNIQUE (name);


--
-- Name: ipam_routetarget ipam_routetarget_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_name_a38e981b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_name_a38e981b_uniq UNIQUE (site_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_slug_6372a304_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_slug_6372a304_uniq UNIQUE (site_id, slug);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: nautobot_golden_config_configcompliance nautobot_golden_config_c_device_id_rule_id_bad42baf_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configcompliance
    ADD CONSTRAINT nautobot_golden_config_c_device_id_rule_id_bad42baf_uniq UNIQUE (device_id, rule_id);


--
-- Name: nautobot_golden_config_compliancerule nautobot_golden_config_c_feature_id_platform_id_d3bedb27_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_compliancerule
    ADD CONSTRAINT nautobot_golden_config_c_feature_id_platform_id_d3bedb27_uniq UNIQUE (feature_id, platform_id);


--
-- Name: nautobot_golden_config_configremove nautobot_golden_config_c_name_platform_id_7172a3d6_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configremove
    ADD CONSTRAINT nautobot_golden_config_c_name_platform_id_7172a3d6_uniq UNIQUE (name, platform_id);


--
-- Name: nautobot_golden_config_configreplace nautobot_golden_config_c_name_platform_id_e164ee7b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configreplace
    ADD CONSTRAINT nautobot_golden_config_c_name_platform_id_e164ee7b_uniq UNIQUE (name, platform_id);


--
-- Name: nautobot_golden_config_compliancefeature nautobot_golden_config_compliancefeature_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_compliancefeature
    ADD CONSTRAINT nautobot_golden_config_compliancefeature_name_key UNIQUE (name);


--
-- Name: nautobot_golden_config_compliancefeature nautobot_golden_config_compliancefeature_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_compliancefeature
    ADD CONSTRAINT nautobot_golden_config_compliancefeature_pkey PRIMARY KEY (id);


--
-- Name: nautobot_golden_config_compliancefeature nautobot_golden_config_compliancefeature_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_compliancefeature
    ADD CONSTRAINT nautobot_golden_config_compliancefeature_slug_key UNIQUE (slug);


--
-- Name: nautobot_golden_config_compliancerule nautobot_golden_config_compliancerule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_compliancerule
    ADD CONSTRAINT nautobot_golden_config_compliancerule_pkey PRIMARY KEY (id);


--
-- Name: nautobot_golden_config_configcompliance nautobot_golden_config_configcompliance_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configcompliance
    ADD CONSTRAINT nautobot_golden_config_configcompliance_pkey PRIMARY KEY (id);


--
-- Name: nautobot_golden_config_configremove nautobot_golden_config_configremove_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configremove
    ADD CONSTRAINT nautobot_golden_config_configremove_pkey PRIMARY KEY (id);


--
-- Name: nautobot_golden_config_configreplace nautobot_golden_config_configreplace_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configreplace
    ADD CONSTRAINT nautobot_golden_config_configreplace_pkey PRIMARY KEY (id);


--
-- Name: nautobot_golden_config_goldenconfig nautobot_golden_config_goldenconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfig
    ADD CONSTRAINT nautobot_golden_config_goldenconfig_pkey PRIMARY KEY (id);


--
-- Name: nautobot_golden_config_goldenconfigsetting nautobot_golden_config_goldenconfigsetting_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfigsetting
    ADD CONSTRAINT nautobot_golden_config_goldenconfigsetting_name_key UNIQUE (name);


--
-- Name: nautobot_golden_config_goldenconfigsetting nautobot_golden_config_goldenconfigsetting_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfigsetting
    ADD CONSTRAINT nautobot_golden_config_goldenconfigsetting_pkey PRIMARY KEY (id);


--
-- Name: nautobot_golden_config_goldenconfigsetting nautobot_golden_config_goldenconfigsetting_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfigsetting
    ADD CONSTRAINT nautobot_golden_config_goldenconfigsetting_slug_key UNIQUE (slug);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_objectpermission_groups users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq UNIQUE (objectpermission_id, group_id);


--
-- Name: users_objectpermission_groups users_objectpermission_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_groups_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_object_types users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq UNIQUE (objectpermission_id, contenttype_id);


--
-- Name: users_objectpermission_object_types users_objectpermission_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_object_types_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission users_objectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_users users_objectpermission_u_objectpermission_id_user_3a7db108_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_u_objectpermission_id_user_3a7db108_uniq UNIQUE (objectpermission_id, user_id);


--
-- Name: users_objectpermission_users users_objectpermission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_pkey PRIMARY KEY (id);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: virtualization_cluster virtualization_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_name_key UNIQUE (name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq UNIQUE (cluster_id, tenant_id, name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: virtualization_vminterface virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq UNIQUE (virtual_machine_id, name);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq UNIQUE (vminterface_id, vlan_id);


--
-- Name: virtualization_vminterface virtualization_vminterface_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_status_id_6433793f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_status_id_6433793f ON public.circuits_circuit USING btree (status_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_termination_a_id_f891adac; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_termination_a_id_f891adac ON public.circuits_circuit USING btree (termination_a_id);


--
-- Name: circuits_circuit_termination_z_id_377b8551; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_termination_z_id_377b8551 ON public.circuits_circuit USING btree (termination_z_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination__cable_peer_type_id_bd122156; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination__cable_peer_type_id_bd122156 ON public.circuits_circuittermination USING btree (_cable_peer_type_id);


--
-- Name: circuits_circuittermination__path_id_6dfd8db0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination__path_id_6dfd8db0 ON public.circuits_circuittermination USING btree (_path_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_provider_network_id_b0c660f1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_provider_network_id_b0c660f1 ON public.circuits_circuittermination USING btree (provider_network_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_providernetwork_name_9d69fb4d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_providernetwork_name_9d69fb4d ON public.circuits_providernetwork USING btree (name);


--
-- Name: circuits_providernetwork_name_9d69fb4d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_providernetwork_name_9d69fb4d_like ON public.circuits_providernetwork USING btree (name varchar_pattern_ops);


--
-- Name: circuits_providernetwork_provider_id_7992236c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_providernetwork_provider_id_7992236c ON public.circuits_providernetwork USING btree (provider_id);


--
-- Name: circuits_providernetwork_slug_7a769c16_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_providernetwork_slug_7a769c16_like ON public.circuits_providernetwork USING btree (slug varchar_pattern_ops);


--
-- Name: constance_config_key_baef3136_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX constance_config_key_baef3136_like ON public.constance_config USING btree (key varchar_pattern_ops);


--
-- Name: dcim_cable__termination_a_device_id_e59cde1c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable__termination_a_device_id_e59cde1c ON public.dcim_cable USING btree (_termination_a_device_id);


--
-- Name: dcim_cable__termination_b_device_id_a9073762; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable__termination_b_device_id_a9073762 ON public.dcim_cable USING btree (_termination_b_device_id);


--
-- Name: dcim_cable_status_id_6a580869; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable_status_id_6a580869 ON public.dcim_cable USING btree (status_id);


--
-- Name: dcim_cable_termination_a_type_id_a614bab8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable_termination_a_type_id_a614bab8 ON public.dcim_cable USING btree (termination_a_type_id);


--
-- Name: dcim_cable_termination_b_type_id_a91595d0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable_termination_b_type_id_a91595d0 ON public.dcim_cable USING btree (termination_b_type_id);


--
-- Name: dcim_cablepath_destination_type_id_a8c1654b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cablepath_destination_type_id_a8c1654b ON public.dcim_cablepath USING btree (destination_type_id);


--
-- Name: dcim_cablepath_origin_type_id_6de54f6d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cablepath_origin_type_id_6de54f6d ON public.dcim_cablepath USING btree (origin_type_id);


--
-- Name: dcim_consoleport__cable_peer_type_id_52adb1be; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport__cable_peer_type_id_52adb1be ON public.dcim_consoleport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleport__name_6ac60d99; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport__name_6ac60d99 ON public.dcim_consoleport USING btree (_name);


--
-- Name: dcim_consoleport__name_6ac60d99_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport__name_6ac60d99_like ON public.dcim_consoleport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_consoleport__path_id_e40a4436; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport__path_id_e40a4436 ON public.dcim_consoleport USING btree (_path_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleport_name_ef94d0d1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport_name_ef94d0d1 ON public.dcim_consoleport USING btree (name);


--
-- Name: dcim_consoleport_name_ef94d0d1_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport_name_ef94d0d1_like ON public.dcim_consoleport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverport__cable_peer_type_id_132b6744; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport__cable_peer_type_id_132b6744 ON public.dcim_consoleserverport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleserverport__name_70f9317c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport__name_70f9317c ON public.dcim_consoleserverport USING btree (_name);


--
-- Name: dcim_consoleserverport__name_70f9317c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport__name_70f9317c_like ON public.dcim_consoleserverport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_consoleserverport__path_id_dc5abe09; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport__path_id_dc5abe09 ON public.dcim_consoleserverport USING btree (_path_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverport_name_2319aaf4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport_name_2319aaf4 ON public.dcim_consoleserverport USING btree (name);


--
-- Name: dcim_consoleserverport_name_2319aaf4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport_name_2319aaf4_like ON public.dcim_consoleserverport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_device__name_a8ed2cdf; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device__name_a8ed2cdf ON public.dcim_device USING btree (_name);


--
-- Name: dcim_device__name_a8ed2cdf_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device__name_a8ed2cdf_like ON public.dcim_device USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_local_context_data_owner_content_type_id_5d06013b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_local_context_data_owner_content_type_id_5d06013b ON public.dcim_device USING btree (local_context_data_owner_content_type_id);


--
-- Name: dcim_device_local_context_schema_id_0ff8d657; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_local_context_schema_id_0ff8d657 ON public.dcim_device USING btree (local_context_schema_id);


--
-- Name: dcim_device_name_cfa61dd8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_name_cfa61dd8 ON public.dcim_device USING btree (name);


--
-- Name: dcim_device_name_cfa61dd8_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_name_cfa61dd8_like ON public.dcim_device USING btree (name varchar_pattern_ops);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_secrets_group_id_52d75f4a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_secrets_group_id_52d75f4a ON public.dcim_device USING btree (secrets_group_id);


--
-- Name: dcim_device_serial_9170722b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_serial_9170722b ON public.dcim_device USING btree (serial);


--
-- Name: dcim_device_serial_9170722b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_serial_9170722b_like ON public.dcim_device USING btree (serial varchar_pattern_ops);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_status_id_96d2fc6f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_status_id_96d2fc6f ON public.dcim_device USING btree (status_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay__name_d9f2bdd3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay__name_d9f2bdd3 ON public.dcim_devicebay USING btree (_name);


--
-- Name: dcim_devicebay__name_d9f2bdd3_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay__name_d9f2bdd3_like ON public.dcim_devicebay USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebay_name_ee470978; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay_name_ee470978 ON public.dcim_devicebay USING btree (name);


--
-- Name: dcim_devicebay_name_ee470978_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay_name_ee470978_like ON public.dcim_devicebay USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport__cable_peer_type_id_c4690f56; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport__cable_peer_type_id_c4690f56 ON public.dcim_frontport USING btree (_cable_peer_type_id);


--
-- Name: dcim_frontport__name_273b2ca3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport__name_273b2ca3 ON public.dcim_frontport USING btree (_name);


--
-- Name: dcim_frontport__name_273b2ca3_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport__name_273b2ca3_like ON public.dcim_frontport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_name_8972111f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_name_8972111f ON public.dcim_frontport USING btree (name);


--
-- Name: dcim_frontport_name_8972111f_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_name_8972111f_like ON public.dcim_frontport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface__cable_peer_type_id_ce52cb81; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface__cable_peer_type_id_ce52cb81 ON public.dcim_interface USING btree (_cable_peer_type_id);


--
-- Name: dcim_interface__name_8796fa61; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface__name_8796fa61 ON public.dcim_interface USING btree (_name);


--
-- Name: dcim_interface__name_8796fa61_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface__name_8796fa61_like ON public.dcim_interface USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_interface__path_id_f8f4f7f0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface__path_id_f8f4f7f0 ON public.dcim_interface USING btree (_path_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_name_bc4e48ab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_name_bc4e48ab ON public.dcim_interface USING btree (name);


--
-- Name: dcim_interface_name_bc4e48ab_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_name_bc4e48ab_like ON public.dcim_interface USING btree (name varchar_pattern_ops);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitem__name_959f73cc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem__name_959f73cc ON public.dcim_inventoryitem USING btree (_name);


--
-- Name: dcim_inventoryitem__name_959f73cc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem__name_959f73cc_like ON public.dcim_inventoryitem USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_device_id_033d83f8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_device_id_033d83f8 ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_inventoryitem_manufacturer_id_dcd1b78a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_manufacturer_id_dcd1b78a ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitem_name_3e415949; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_name_3e415949 ON public.dcim_inventoryitem USING btree (name);


--
-- Name: dcim_inventoryitem_name_3e415949_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_name_3e415949_like ON public.dcim_inventoryitem USING btree (name varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_parent_id_7ebcd457; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_parent_id_7ebcd457 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_inventoryitem_serial_9f53019e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_serial_9f53019e ON public.dcim_inventoryitem USING btree (serial);


--
-- Name: dcim_inventoryitem_serial_9f53019e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_serial_9f53019e_like ON public.dcim_inventoryitem USING btree (serial varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_tree_id_4676ade2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_tree_id_4676ade2 ON public.dcim_inventoryitem USING btree (tree_id);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed__cable_peer_type_id_9f930589; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed__cable_peer_type_id_9f930589 ON public.dcim_powerfeed USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerfeed__path_id_a1ea1f28; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed__path_id_a1ea1f28 ON public.dcim_powerfeed USING btree (_path_id);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_powerfeed_status_id_8c424cc3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed_status_id_8c424cc3 ON public.dcim_powerfeed USING btree (status_id);


--
-- Name: dcim_poweroutlet__cable_peer_type_id_bbff28d0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet__cable_peer_type_id_bbff28d0 ON public.dcim_poweroutlet USING btree (_cable_peer_type_id);


--
-- Name: dcim_poweroutlet__name_0ecdd374; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet__name_0ecdd374 ON public.dcim_poweroutlet USING btree (_name);


--
-- Name: dcim_poweroutlet__name_0ecdd374_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet__name_0ecdd374_like ON public.dcim_poweroutlet USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_poweroutlet__path_id_cbb47bb9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet__path_id_cbb47bb9 ON public.dcim_poweroutlet USING btree (_path_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_name_98c8e7a2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_name_98c8e7a2 ON public.dcim_poweroutlet USING btree (name);


--
-- Name: dcim_poweroutlet_name_98c8e7a2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_name_98c8e7a2_like ON public.dcim_poweroutlet USING btree (name varchar_pattern_ops);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_name_09946067; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_name_09946067 ON public.dcim_powerpanel USING btree (name);


--
-- Name: dcim_powerpanel_name_09946067_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_name_09946067_like ON public.dcim_powerpanel USING btree (name varchar_pattern_ops);


--
-- Name: dcim_powerpanel_rack_group_id_76467cc9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_rack_group_id_76467cc9 ON public.dcim_powerpanel USING btree (rack_group_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport__cable_peer_type_id_9df2a278; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport__cable_peer_type_id_9df2a278 ON public.dcim_powerport USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerport__name_cd2ccdac; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport__name_cd2ccdac ON public.dcim_powerport USING btree (_name);


--
-- Name: dcim_powerport__name_cd2ccdac_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport__name_cd2ccdac_like ON public.dcim_powerport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_powerport__path_id_9fe4af8f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport__path_id_9fe4af8f ON public.dcim_powerport USING btree (_path_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerport_name_8b95aa68; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport_name_8b95aa68 ON public.dcim_powerport USING btree (name);


--
-- Name: dcim_powerport_name_8b95aa68_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport_name_8b95aa68_like ON public.dcim_powerport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_rack__name_e3323581; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack__name_e3323581 ON public.dcim_rack USING btree (_name);


--
-- Name: dcim_rack__name_e3323581_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack__name_e3323581_like ON public.dcim_rack USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_group_id_44e90ea9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_group_id_44e90ea9 ON public.dcim_rack USING btree (group_id);


--
-- Name: dcim_rack_name_b74aa0b4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_name_b74aa0b4 ON public.dcim_rack USING btree (name);


--
-- Name: dcim_rack_name_b74aa0b4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_name_b74aa0b4_like ON public.dcim_rack USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_serial_d9cd7ac4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_serial_d9cd7ac4 ON public.dcim_rack USING btree (serial);


--
-- Name: dcim_rack_serial_d9cd7ac4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_serial_d9cd7ac4_like ON public.dcim_rack USING btree (serial varchar_pattern_ops);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_status_id_ee3dee3e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_status_id_ee3dee3e ON public.dcim_rack USING btree (status_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackgroup_name_6a84593a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_name_6a84593a ON public.dcim_rackgroup USING btree (name);


--
-- Name: dcim_rackgroup_name_6a84593a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_name_6a84593a_like ON public.dcim_rackgroup USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackgroup_parent_id_cc315105; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_parent_id_cc315105 ON public.dcim_rackgroup USING btree (parent_id);


--
-- Name: dcim_rackgroup_site_id_13520e89; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_site_id_13520e89 ON public.dcim_rackgroup USING btree (site_id);


--
-- Name: dcim_rackgroup_slug_3f4582a7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7 ON public.dcim_rackgroup USING btree (slug);


--
-- Name: dcim_rackgroup_slug_3f4582a7_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7_like ON public.dcim_rackgroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rackgroup_tree_id_9c2ad6f4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_tree_id_9c2ad6f4 ON public.dcim_rackgroup USING btree (tree_id);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport__cable_peer_type_id_cecf241c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport__cable_peer_type_id_cecf241c ON public.dcim_rearport USING btree (_cable_peer_type_id);


--
-- Name: dcim_rearport__name_50f20c9e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport__name_50f20c9e ON public.dcim_rearport USING btree (_name);


--
-- Name: dcim_rearport__name_50f20c9e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport__name_50f20c9e_like ON public.dcim_rearport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearport_name_2300a129; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport_name_2300a129 ON public.dcim_rearport USING btree (name);


--
-- Name: dcim_rearport_name_2300a129_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport_name_2300a129_like ON public.dcim_rearport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_region_name_ba5a7082_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_region_name_ba5a7082_like ON public.dcim_region USING btree (name varchar_pattern_ops);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site__name_6144ca75; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site__name_6144ca75 ON public.dcim_site USING btree (_name);


--
-- Name: dcim_site__name_6144ca75_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site__name_6144ca75_like ON public.dcim_site USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_status_id_e6a50f56; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_status_id_e6a50f56 ON public.dcim_site USING btree (status_id);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: dcim_virtualchassis_name_7dcc237d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_virtualchassis_name_7dcc237d ON public.dcim_virtualchassis USING btree (name);


--
-- Name: dcim_virtualchassis_name_7dcc237d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_virtualchassis_name_7dcc237d_like ON public.dcim_virtualchassis USING btree (name varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_computedfield_content_type_id_def6603f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_computedfield_content_type_id_def6603f ON public.extras_computedfield USING btree (content_type_id);


--
-- Name: extras_computedfield_slug_3c4b9636_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_computedfield_slug_3c4b9636_like ON public.extras_computedfield USING btree (slug varchar_pattern_ops);


--
-- Name: extras_configcontext_cluster_groups_clustergroup_id_f4322ce8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_cluster_groups_clustergroup_id_f4322ce8 ON public.extras_configcontext_cluster_groups USING btree (clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups_configcontext_id_8f50b794; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_cluster_groups_configcontext_id_8f50b794 ON public.extras_configcontext_cluster_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_clusters_cluster_id_6abd47a1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_clusters_cluster_id_6abd47a1 ON public.extras_configcontext_clusters USING btree (cluster_id);


--
-- Name: extras_configcontext_clusters_configcontext_id_ed579a40; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_clusters_configcontext_id_ed579a40 ON public.extras_configcontext_clusters USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_configcontext_id_55632923; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_device_types_configcontext_id_55632923 ON public.extras_configcontext_device_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_devicetype_id_b8788c2d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_device_types_devicetype_id_b8788c2d ON public.extras_configcontext_device_types USING btree (devicetype_id);


--
-- Name: extras_configcontext_name_4bbfe25d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_name_4bbfe25d ON public.extras_configcontext USING btree (name);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_owner_content_type_id_af30e837; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_owner_content_type_id_af30e837 ON public.extras_configcontext USING btree (owner_content_type_id);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_schema_id_1a9d39fe; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_schema_id_1a9d39fe ON public.extras_configcontext USING btree (schema_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tags_configcontext_id_64a392b1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tags_configcontext_id_64a392b1 ON public.extras_configcontext_tags USING btree (configcontext_id);


--
-- Name: extras_configcontext_tags_tag_id_129a5d87; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tags_tag_id_129a5d87 ON public.extras_configcontext_tags USING btree (tag_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_configcontextschema_name_e2a3ef7b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_name_e2a3ef7b_like ON public.extras_configcontextschema USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontextschema_owner_content_type_id_0a0756bc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_owner_content_type_id_0a0756bc ON public.extras_configcontextschema USING btree (owner_content_type_id);


--
-- Name: extras_configcontextschema_slug_80083c21; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_slug_80083c21 ON public.extras_configcontextschema USING btree (slug);


--
-- Name: extras_configcontextschema_slug_80083c21_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_slug_80083c21_like ON public.extras_configcontextschema USING btree (slug varchar_pattern_ops);


--
-- Name: extras_customfield_content_types_contenttype_id_2997ba90; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_content_types_contenttype_id_2997ba90 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_content_types_customfield_id_3842aaf3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_content_types_customfield_id_3842aaf3 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customfieldchoice_field_id_35006739; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfieldchoice_field_id_35006739 ON public.extras_customfieldchoice USING btree (field_id);


--
-- Name: extras_customlink_content_type_id_4d35b063; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customlink_content_type_id_4d35b063 ON public.extras_customlink USING btree (content_type_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_dynamicgroup_content_type_id_1bed5de5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_dynamicgroup_content_type_id_1bed5de5 ON public.extras_dynamicgroup USING btree (content_type_id);


--
-- Name: extras_dynamicgroup_name_46a8d891_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_dynamicgroup_name_46a8d891_like ON public.extras_dynamicgroup USING btree (name varchar_pattern_ops);


--
-- Name: extras_dynamicgroup_slug_628154a6_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_dynamicgroup_slug_628154a6_like ON public.extras_dynamicgroup USING btree (slug varchar_pattern_ops);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_exporttemplate_owner_content_type_id_6bb67821; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_exporttemplate_owner_content_type_id_6bb67821 ON public.extras_exporttemplate USING btree (owner_content_type_id);


--
-- Name: extras_gitrepository_name_b85445c9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_gitrepository_name_b85445c9_like ON public.extras_gitrepository USING btree (name varchar_pattern_ops);


--
-- Name: extras_gitrepository_secrets_group_id_fd1fdceb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_gitrepository_secrets_group_id_fd1fdceb ON public.extras_gitrepository USING btree (secrets_group_id);


--
-- Name: extras_gitrepository_slug_a71da0ac_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_gitrepository_slug_a71da0ac_like ON public.extras_gitrepository USING btree (slug varchar_pattern_ops);


--
-- Name: extras_graphqlquery_name_53899a98_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_graphqlquery_name_53899a98_like ON public.extras_graphqlquery USING btree (name varchar_pattern_ops);


--
-- Name: extras_graphqlquery_slug_cbac99ad_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_graphqlquery_slug_cbac99ad_like ON public.extras_graphqlquery USING btree (slug varchar_pattern_ops);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_imageattachment_name_04f9d9dd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_imageattachment_name_04f9d9dd ON public.extras_imageattachment USING btree (name);


--
-- Name: extras_imageattachment_name_04f9d9dd_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_imageattachment_name_04f9d9dd_like ON public.extras_imageattachment USING btree (name varchar_pattern_ops);


--
-- Name: extras_imageattachment_object_id_f5308bf7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_imageattachment_object_id_f5308bf7 ON public.extras_imageattachment USING btree (object_id);


--
-- Name: extras_job_git_repository_id_9ee97baf; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_git_repository_id_9ee97baf ON public.extras_job USING btree (git_repository_id);


--
-- Name: extras_job_grouping_692d2dc2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_grouping_692d2dc2 ON public.extras_job USING btree ("grouping");


--
-- Name: extras_job_grouping_692d2dc2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_grouping_692d2dc2_like ON public.extras_job USING btree ("grouping" varchar_pattern_ops);


--
-- Name: extras_job_hidden_f4b1d9d5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_hidden_f4b1d9d5 ON public.extras_job USING btree (hidden);


--
-- Name: extras_job_installed_9b043061; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_installed_9b043061 ON public.extras_job USING btree (installed);


--
-- Name: extras_job_job_class_name_d9c82b93; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_job_class_name_d9c82b93 ON public.extras_job USING btree (job_class_name);


--
-- Name: extras_job_job_class_name_d9c82b93_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_job_class_name_d9c82b93_like ON public.extras_job USING btree (job_class_name varchar_pattern_ops);


--
-- Name: extras_job_module_name_912a3dda; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_module_name_912a3dda ON public.extras_job USING btree (module_name);


--
-- Name: extras_job_module_name_912a3dda_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_module_name_912a3dda_like ON public.extras_job USING btree (module_name varchar_pattern_ops);


--
-- Name: extras_job_name_34d98c40; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_name_34d98c40 ON public.extras_job USING btree (name);


--
-- Name: extras_job_name_34d98c40_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_name_34d98c40_like ON public.extras_job USING btree (name varchar_pattern_ops);


--
-- Name: extras_job_slug_a6e32b86_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_slug_a6e32b86_like ON public.extras_job USING btree (slug varchar_pattern_ops);


--
-- Name: extras_job_source_2dddec01; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_source_2dddec01 ON public.extras_job USING btree (source);


--
-- Name: extras_job_source_2dddec01_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_source_2dddec01_like ON public.extras_job USING btree (source varchar_pattern_ops);


--
-- Name: extras_joblogentry_job_result_id_91e10d1a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_joblogentry_job_result_id_91e10d1a ON public.extras_joblogentry USING btree (job_result_id);


--
-- Name: extras_joblogentry_log_level_f8cfe898; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_joblogentry_log_level_f8cfe898 ON public.extras_joblogentry USING btree (log_level);


--
-- Name: extras_joblogentry_log_level_f8cfe898_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_joblogentry_log_level_f8cfe898_like ON public.extras_joblogentry USING btree (log_level varchar_pattern_ops);


--
-- Name: extras_jobresult_job_model_id_d581ec7e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_job_model_id_d581ec7e ON public.extras_jobresult USING btree (job_model_id);


--
-- Name: extras_jobresult_name_3f143125; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_name_3f143125 ON public.extras_jobresult USING btree (name);


--
-- Name: extras_jobresult_name_3f143125_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_name_3f143125_like ON public.extras_jobresult USING btree (name varchar_pattern_ops);


--
-- Name: extras_jobresult_obj_type_id_475e80aa; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_obj_type_id_475e80aa ON public.extras_jobresult USING btree (obj_type_id);


--
-- Name: extras_jobresult_schedule_id_24ce985a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_schedule_id_24ce985a ON public.extras_jobresult USING btree (schedule_id);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_objectchange_changed_object_id_efb1a943; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_changed_object_id_efb1a943 ON public.extras_objectchange USING btree (changed_object_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_double_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_double_idx ON public.extras_objectchange USING btree (request_id, changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_request_id_4ae21e90; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_request_id_4ae21e90 ON public.extras_objectchange USING btree (request_id);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_triple_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_triple_idx ON public.extras_objectchange USING btree (request_id, changed_object_type_id, changed_object_id);


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_relationship_destination_type_id_fb7387c3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_destination_type_id_fb7387c3 ON public.extras_relationship USING btree (destination_type_id);


--
-- Name: extras_relationship_name_5f6f8ea2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_name_5f6f8ea2_like ON public.extras_relationship USING btree (name varchar_pattern_ops);


--
-- Name: extras_relationship_slug_e09b40f4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_slug_e09b40f4_like ON public.extras_relationship USING btree (slug varchar_pattern_ops);


--
-- Name: extras_relationship_source_type_id_21183ad6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_source_type_id_21183ad6 ON public.extras_relationship USING btree (source_type_id);


--
-- Name: extras_relationshipassociation_destination_id_83f811cb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_destination_id_83f811cb ON public.extras_relationshipassociation USING btree (destination_id);


--
-- Name: extras_relationshipassociation_destination_type_id_5ccb6728; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_destination_type_id_5ccb6728 ON public.extras_relationshipassociation USING btree (destination_type_id);


--
-- Name: extras_relationshipassociation_relationship_id_9a65ccc8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_relationship_id_9a65ccc8 ON public.extras_relationshipassociation USING btree (relationship_id);


--
-- Name: extras_relationshipassociation_source_id_cb8931c1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_source_id_cb8931c1 ON public.extras_relationshipassociation USING btree (source_id);


--
-- Name: extras_relationshipassociation_source_type_id_28c8df60; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_source_type_id_28c8df60 ON public.extras_relationshipassociation USING btree (source_type_id);


--
-- Name: extras_scheduledjob_approved_by_user_id_06b8fb0a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_approved_by_user_id_06b8fb0a ON public.extras_scheduledjob USING btree (approved_by_user_id);


--
-- Name: extras_scheduledjob_job_class_c1c4178e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_job_class_c1c4178e ON public.extras_scheduledjob USING btree (job_class);


--
-- Name: extras_scheduledjob_job_class_c1c4178e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_job_class_c1c4178e_like ON public.extras_scheduledjob USING btree (job_class varchar_pattern_ops);


--
-- Name: extras_scheduledjob_job_model_id_d4c0711e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_job_model_id_d4c0711e ON public.extras_scheduledjob USING btree (job_model_id);


--
-- Name: extras_scheduledjob_name_fcea52d7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_name_fcea52d7 ON public.extras_scheduledjob USING btree (name);


--
-- Name: extras_scheduledjob_name_fcea52d7_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_name_fcea52d7_like ON public.extras_scheduledjob USING btree (name varchar_pattern_ops);


--
-- Name: extras_scheduledjob_queue_681f2627; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_queue_681f2627 ON public.extras_scheduledjob USING btree (queue);


--
-- Name: extras_scheduledjob_queue_681f2627_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_queue_681f2627_like ON public.extras_scheduledjob USING btree (queue varchar_pattern_ops);


--
-- Name: extras_scheduledjob_task_7eaf2d6d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_task_7eaf2d6d ON public.extras_scheduledjob USING btree (task);


--
-- Name: extras_scheduledjob_task_7eaf2d6d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_task_7eaf2d6d_like ON public.extras_scheduledjob USING btree (task varchar_pattern_ops);


--
-- Name: extras_scheduledjob_user_id_4d8034ff; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_user_id_4d8034ff ON public.extras_scheduledjob USING btree (user_id);


--
-- Name: extras_secret_name_5e2de97e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secret_name_5e2de97e_like ON public.extras_secret USING btree (name varchar_pattern_ops);


--
-- Name: extras_secret_slug_cf3c7c3c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secret_slug_cf3c7c3c_like ON public.extras_secret USING btree (slug varchar_pattern_ops);


--
-- Name: extras_secretsgroup_name_626cec38_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroup_name_626cec38_like ON public.extras_secretsgroup USING btree (name varchar_pattern_ops);


--
-- Name: extras_secretsgroup_slug_a523052e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroup_slug_a523052e_like ON public.extras_secretsgroup USING btree (slug varchar_pattern_ops);


--
-- Name: extras_secretsgroupassociation_group_id_68ca43f6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroupassociation_group_id_68ca43f6 ON public.extras_secretsgroupassociation USING btree (group_id);


--
-- Name: extras_secretsgroupassociation_secret_id_14d43d7e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroupassociation_secret_id_14d43d7e ON public.extras_secretsgroupassociation USING btree (secret_id);


--
-- Name: extras_status_content_types_contenttype_id_38503e74; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_status_content_types_contenttype_id_38503e74 ON public.extras_status_content_types USING btree (contenttype_id);


--
-- Name: extras_status_content_types_status_id_27c665c7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_status_content_types_status_id_27c665c7 ON public.extras_status_content_types USING btree (status_id);


--
-- Name: extras_status_name_d8897514_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_status_name_d8897514_like ON public.extras_status USING btree (name varchar_pattern_ops);


--
-- Name: extras_status_slug_6f38c09c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_status_slug_6f38c09c_like ON public.extras_status USING btree (slug varchar_pattern_ops);


--
-- Name: extras_tag_content_types_contenttype_id_5baa3bb5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_tag_content_types_contenttype_id_5baa3bb5 ON public.extras_tag_content_types USING btree (contenttype_id);


--
-- Name: extras_tag_content_types_tag_id_34a8ca46; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_tag_content_types_tag_id_34a8ca46 ON public.extras_tag_content_types USING btree (tag_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_webhook_content_types_contenttype_id_3fc2c4d3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_webhook_content_types_contenttype_id_3fc2c4d3 ON public.extras_webhook_content_types USING btree (contenttype_id);


--
-- Name: extras_webhook_content_types_webhook_id_0c169800; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_webhook_content_types_webhook_id_0c169800 ON public.extras_webhook_content_types USING btree (webhook_id);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: ipam_aggregate_broadcast_cff7c80e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_broadcast_cff7c80e ON public.ipam_aggregate USING btree (broadcast);


--
-- Name: ipam_aggregate_network_e8d5e036; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_network_e8d5e036 ON public.ipam_aggregate USING btree (network);


--
-- Name: ipam_aggregate_prefix_length_da6bd002; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_prefix_length_da6bd002 ON public.ipam_aggregate USING btree (prefix_length);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_aggregate_tenant_id_637dd1a1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_tenant_id_637dd1a1 ON public.ipam_aggregate USING btree (tenant_id);


--
-- Name: ipam_ipaddress_assigned_object_id_cff64474; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_assigned_object_id_cff64474 ON public.ipam_ipaddress USING btree (assigned_object_id);


--
-- Name: ipam_ipaddress_assigned_object_type_id_02354370; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_assigned_object_type_id_02354370 ON public.ipam_ipaddress USING btree (assigned_object_type_id);


--
-- Name: ipam_ipaddress_broadcast_f3d0b760; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_broadcast_f3d0b760 ON public.ipam_ipaddress USING btree (broadcast);


--
-- Name: ipam_ipaddress_dns_name_d5c4f5d8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_dns_name_d5c4f5d8 ON public.ipam_ipaddress USING btree (dns_name);


--
-- Name: ipam_ipaddress_dns_name_d5c4f5d8_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_dns_name_d5c4f5d8_like ON public.ipam_ipaddress USING btree (dns_name varchar_pattern_ops);


--
-- Name: ipam_ipaddress_host_c1f8ad3e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_host_c1f8ad3e ON public.ipam_ipaddress USING btree (host);


--
-- Name: ipam_ipaddress_nat_inside_id_a45fb7c5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_nat_inside_id_a45fb7c5 ON public.ipam_ipaddress USING btree (nat_inside_id);


--
-- Name: ipam_ipaddress_prefix_length_f80d3663; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_prefix_length_f80d3663 ON public.ipam_ipaddress USING btree (prefix_length);


--
-- Name: ipam_ipaddress_role_ff25f462; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_role_ff25f462 ON public.ipam_ipaddress USING btree (role);


--
-- Name: ipam_ipaddress_role_ff25f462_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_role_ff25f462_like ON public.ipam_ipaddress USING btree (role varchar_pattern_ops);


--
-- Name: ipam_ipaddress_status_id_942778b7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_status_id_942778b7 ON public.ipam_ipaddress USING btree (status_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_prefix_broadcast_8e623832; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_broadcast_8e623832 ON public.ipam_prefix USING btree (broadcast);


--
-- Name: ipam_prefix_network_f7bac882; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_network_f7bac882 ON public.ipam_prefix USING btree (network);


--
-- Name: ipam_prefix_prefix_length_84660485; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_prefix_length_84660485 ON public.ipam_prefix USING btree (prefix_length);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_status_id_cffa56c0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_status_id_cffa56c0 ON public.ipam_prefix USING btree (status_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_routetarget_name_212be79f_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_routetarget_name_212be79f_like ON public.ipam_routetarget USING btree (name varchar_pattern_ops);


--
-- Name: ipam_routetarget_tenant_id_5a0b35e8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_routetarget_tenant_id_5a0b35e8 ON public.ipam_routetarget USING btree (tenant_id);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_name_7e839153; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_name_7e839153 ON public.ipam_service USING btree (name);


--
-- Name: ipam_service_name_7e839153_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_name_7e839153_like ON public.ipam_service USING btree (name varchar_pattern_ops);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_name_a7671201; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_name_a7671201 ON public.ipam_vlan USING btree (name);


--
-- Name: ipam_vlan_name_a7671201_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_name_a7671201_like ON public.ipam_vlan USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_status_id_898aa317; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_status_id_898aa317 ON public.ipam_vlan USING btree (status_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_name_46bf02a4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_name_46bf02a4 ON public.ipam_vlangroup USING btree (name);


--
-- Name: ipam_vlangroup_name_46bf02a4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_name_46bf02a4_like ON public.ipam_vlangroup USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlangroup_site_id_264f36f6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_site_id_264f36f6 ON public.ipam_vlangroup USING btree (site_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_export_targets_routetarget_id_8d9319f7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_export_targets_routetarget_id_8d9319f7 ON public.ipam_vrf_export_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_export_targets_vrf_id_6f4875c4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_export_targets_vrf_id_6f4875c4 ON public.ipam_vrf_export_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_import_targets_routetarget_id_0e05b144; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_import_targets_routetarget_id_0e05b144 ON public.ipam_vrf_import_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_import_targets_vrf_id_ed491b19; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_import_targets_vrf_id_ed491b19 ON public.ipam_vrf_import_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_name_bf7146b0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_name_bf7146b0 ON public.ipam_vrf USING btree (name);


--
-- Name: ipam_vrf_name_bf7146b0_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_name_bf7146b0_like ON public.ipam_vrf USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: nautobot_golden_config_compliancefeature_name_a03602be_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_compliancefeature_name_a03602be_like ON public.nautobot_golden_config_compliancefeature USING btree (name varchar_pattern_ops);


--
-- Name: nautobot_golden_config_compliancefeature_slug_52ee58b1_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_compliancefeature_slug_52ee58b1_like ON public.nautobot_golden_config_compliancefeature USING btree (slug varchar_pattern_ops);


--
-- Name: nautobot_golden_config_compliancerule_feature_id_599d326c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_compliancerule_feature_id_599d326c ON public.nautobot_golden_config_compliancerule USING btree (feature_id);


--
-- Name: nautobot_golden_config_compliancerule_platform_id_fefbb62e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_compliancerule_platform_id_fefbb62e ON public.nautobot_golden_config_compliancerule USING btree (platform_id);


--
-- Name: nautobot_golden_config_configcompliance_device_id_e79e9798; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_configcompliance_device_id_e79e9798 ON public.nautobot_golden_config_configcompliance USING btree (device_id);


--
-- Name: nautobot_golden_config_configcompliance_rule_id_aad296a7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_configcompliance_rule_id_aad296a7 ON public.nautobot_golden_config_configcompliance USING btree (rule_id);


--
-- Name: nautobot_golden_config_configremove_platform_id_a230d573; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_configremove_platform_id_a230d573 ON public.nautobot_golden_config_configremove USING btree (platform_id);


--
-- Name: nautobot_golden_config_configreplace_platform_id_46e5eda2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_configreplace_platform_id_46e5eda2 ON public.nautobot_golden_config_configreplace USING btree (platform_id);


--
-- Name: nautobot_golden_config_gol_backup_repository_id_0c51f491; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_gol_backup_repository_id_0c51f491 ON public.nautobot_golden_config_goldenconfigsetting USING btree (backup_repository_id);


--
-- Name: nautobot_golden_config_gol_intended_repository_id_4dd88f85; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_gol_intended_repository_id_4dd88f85 ON public.nautobot_golden_config_goldenconfigsetting USING btree (intended_repository_id);


--
-- Name: nautobot_golden_config_gol_jinja_repository_id_1dad39a4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_gol_jinja_repository_id_1dad39a4 ON public.nautobot_golden_config_goldenconfigsetting USING btree (jinja_repository_id);


--
-- Name: nautobot_golden_config_gol_sot_agg_query_id_fdaec944; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_gol_sot_agg_query_id_fdaec944 ON public.nautobot_golden_config_goldenconfigsetting USING btree (sot_agg_query_id);


--
-- Name: nautobot_golden_config_goldenconfig_device_id_2180ab89; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_goldenconfig_device_id_2180ab89 ON public.nautobot_golden_config_goldenconfig USING btree (device_id);


--
-- Name: nautobot_golden_config_goldenconfigsetting_name_c6e8eb3c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_goldenconfigsetting_name_c6e8eb3c_like ON public.nautobot_golden_config_goldenconfigsetting USING btree (name varchar_pattern_ops);


--
-- Name: nautobot_golden_config_goldenconfigsetting_slug_308b7200_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX nautobot_golden_config_goldenconfigsetting_slug_308b7200_like ON public.nautobot_golden_config_goldenconfigsetting USING btree (slug varchar_pattern_ops);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_tree_id_769a98bf; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_tree_id_769a98bf ON public.tenancy_tenantgroup USING btree (tree_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_obj_objectpermission_id_38c7d8f5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_obj_objectpermission_id_38c7d8f5 ON public.users_objectpermission_object_types USING btree (objectpermission_id);


--
-- Name: users_objectpermission_object_types_contenttype_id_594b1cc7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_object_types_contenttype_id_594b1cc7 ON public.users_objectpermission_object_types USING btree (contenttype_id);


--
-- Name: users_objectpermission_users_objectpermission_id_78a9c2e6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_users_objectpermission_id_78a9c2e6 ON public.users_objectpermission_users USING btree (objectpermission_id);


--
-- Name: users_objectpermission_users_user_id_16c0905d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_users_user_id_16c0905d ON public.users_objectpermission_users USING btree (user_id);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_name_1b59a61b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_name_1b59a61b_like ON public.virtualization_cluster USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmach_local_context_data_owner_c_f760366b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmach_local_context_data_owner_c_f760366b ON public.virtualization_virtualmachine USING btree (local_context_data_owner_content_type_id);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_local_context_schema_id_d359876d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_local_context_schema_id_d359876d ON public.virtualization_virtualmachine USING btree (local_context_schema_id);


--
-- Name: virtualization_virtualmachine_name_266f6cdc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_name_266f6cdc ON public.virtualization_virtualmachine USING btree (name);


--
-- Name: virtualization_virtualmachine_name_266f6cdc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_name_266f6cdc_like ON public.virtualization_virtualmachine USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_status_id_ff17be20; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_status_id_ff17be20 ON public.virtualization_virtualmachine USING btree (status_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: virtualization_vminterface__name_0052e83a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface__name_0052e83a ON public.virtualization_vminterface USING btree (_name);


--
-- Name: virtualization_vminterface__name_0052e83a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface__name_0052e83a_like ON public.virtualization_vminterface USING btree (_name varchar_pattern_ops);


--
-- Name: virtualization_vminterface_name_8b75a799; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_name_8b75a799 ON public.virtualization_vminterface USING btree (name);


--
-- Name: virtualization_vminterface_name_8b75a799_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_name_8b75a799_like ON public.virtualization_vminterface USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_vminterface_tagged_vlans_vlan_id_4e77411e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vlan_id_4e77411e ON public.virtualization_vminterface_tagged_vlans USING btree (vlan_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vminterface_id_904b12de; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vminterface_id_904b12de ON public.virtualization_vminterface_tagged_vlans USING btree (vminterface_id);


--
-- Name: virtualization_vminterface_untagged_vlan_id_aea4fc69; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_untagged_vlan_id_aea4fc69 ON public.virtualization_vminterface USING btree (untagged_vlan_id);


--
-- Name: virtualization_vminterface_virtual_machine_id_e9f89829; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_virtual_machine_id_e9f89829 ON public.virtualization_vminterface USING btree (virtual_machine_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_status_id_6433793f_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_status_id_6433793f_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_a_id_f891adac_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_a_id_f891adac_fk_circuits_ FOREIGN KEY (termination_a_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_z_id_377b8551_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_z_id_377b8551_fk_circuits_ FOREIGN KEY (termination_z_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_ FOREIGN KEY (provider_network_id) REFERENCES public.circuits_providernetwork(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_providernetwork circuits_providernet_provider_id_7992236c_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernet_provider_id_7992236c_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id FOREIGN KEY (_termination_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id FOREIGN KEY (_termination_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_status_id_6a580869_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_status_id_6a580869_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_a_type_i_a614bab8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_i_a614bab8_fk_django_co FOREIGN KEY (termination_a_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_b_type_i_a91595d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_i_a91595d0_fk_django_co FOREIGN KEY (termination_b_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_destination_type_id_a8c1654b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_destination_type_id_a8c1654b_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_6de54f6d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_6de54f6d_fk_django_co FOREIGN KEY (origin_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_local_context_data_o_5d06013b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_local_context_data_o_5d06013b_fk_django_co FOREIGN KEY (local_context_data_owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_local_context_schema_0ff8d657_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_local_context_schema_0ff8d657_fk_extras_co FOREIGN KEY (local_context_schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id FOREIGN KEY (secrets_group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_status_id_96d2fc6f_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_status_id_96d2fc6f_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_status_id_8c424cc3_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_status_id_8c424cc3_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id FOREIGN KEY (rack_group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_status_id_ee3dee3e_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_status_id_ee3dee3e_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id FOREIGN KEY (parent_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_13520e89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_13520e89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_status_id_e6a50f56_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_status_id_e6a50f56_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_computedfield extras_computedfield_content_type_id_def6603f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_computedfield
    ADD CONSTRAINT extras_computedfield_content_type_id_def6603f_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_cluster_id_6abd47a1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_cluster_id_6abd47a1_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz FOREIGN KEY (clustergroup_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_configcontext_id_55632923_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_55632923_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_configcontext_id_64a392b1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_configcontext_id_64a392b1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_configcontext_id_8f50b794_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_8f50b794_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_configcontext_id_ed579a40_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_configcontext_id_ed579a40_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi FOREIGN KEY (devicetype_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontextschema extras_configcontext_owner_content_type_i_0a0756bc_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontextschema
    ADD CONSTRAINT extras_configcontext_owner_content_type_i_0a0756bc_fk_django_co FOREIGN KEY (owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext extras_configcontext_owner_content_type_i_af30e837_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_owner_content_type_i_af30e837_fk_django_co FOREIGN KEY (owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext extras_configcontext_schema_id_1a9d39fe_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_schema_id_1a9d39fe_fk_extras_co FOREIGN KEY (schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_contenttype_id_2997ba90_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_contenttype_id_2997ba90_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfieldchoice extras_customfieldch_field_id_35006739_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldch_field_id_35006739_fk_extras_cu FOREIGN KEY (field_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink extras_customlink_content_type_id_4d35b063_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_content_type_id_4d35b063_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_dynamicgroup extras_dynamicgroup_content_type_id_1bed5de5_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroup
    ADD CONSTRAINT extras_dynamicgroup_content_type_id_1bed5de5_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_owner_content_type_i_6bb67821_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_owner_content_type_i_6bb67821_fk_django_co FOREIGN KEY (owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_job extras_job_git_repository_id_9ee97baf_fk_extras_gi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_job_git_repository_id_9ee97baf_fk_extras_gi FOREIGN KEY (git_repository_id) REFERENCES public.extras_gitrepository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_joblogentry extras_joblogentry_job_result_id_91e10d1a_fk_extras_jo; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_joblogentry
    ADD CONSTRAINT extras_joblogentry_job_result_id_91e10d1a_fk_extras_jo FOREIGN KEY (job_result_id) REFERENCES public.extras_jobresult(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_schedule_id_24ce985a_fk_extras_scheduledjob_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_schedule_id_24ce985a_fk_extras_scheduledjob_id FOREIGN KEY (schedule_id) REFERENCES public.extras_scheduledjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_user_id_d35285ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_user_id_d35285ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationship extras_relationship_destination_type_id_fb7387c3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_destination_type_id_fb7387c3_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationship extras_relationship_source_type_id_21183ad6_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_source_type_id_21183ad6_fk_django_co FOREIGN KEY (source_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationshipassociation extras_relationshipa_destination_type_id_5ccb6728_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipa_destination_type_id_5ccb6728_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationshipassociation extras_relationshipa_relationship_id_9a65ccc8_fk_extras_re; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipa_relationship_id_9a65ccc8_fk_extras_re FOREIGN KEY (relationship_id) REFERENCES public.extras_relationship(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationshipassociation extras_relationshipa_source_type_id_28c8df60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipa_source_type_id_28c8df60_fk_django_co FOREIGN KEY (source_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_scheduledjob extras_scheduledjob_approved_by_user_id_06b8fb0a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_approved_by_user_id_06b8fb0a_fk_auth_user FOREIGN KEY (approved_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_scheduledjob extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id FOREIGN KEY (job_model_id) REFERENCES public.extras_job(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_scheduledjob extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_status_content_types extras_status_conten_contenttype_id_38503e74_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types
    ADD CONSTRAINT extras_status_conten_contenttype_id_38503e74_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_status_content_types extras_status_conten_status_id_27c665c7_fk_extras_st; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types
    ADD CONSTRAINT extras_status_conten_status_id_27c665c7_fk_extras_st FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_tag_content_types extras_tag_content_t_contenttype_id_5baa3bb5_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types
    ADD CONSTRAINT extras_tag_content_t_contenttype_id_5baa3bb5_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_tag_content_types extras_tag_content_types_tag_id_34a8ca46_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types
    ADD CONSTRAINT extras_tag_content_types_tag_id_34a8ca46_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_webhook_id_0c169800_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_webhook_id_0c169800_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_assigned_object_type_02354370_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_assigned_object_type_02354370_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_status_id_942778b7_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_status_id_942778b7_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_status_id_cffa56c0_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_status_id_cffa56c0_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_routetarget ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_status_id_898aa317_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_status_id_898aa317_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_goldenconfigsetting nautobot_golden_conf_backup_repository_id_0c51f491_fk_extras_gi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfigsetting
    ADD CONSTRAINT nautobot_golden_conf_backup_repository_id_0c51f491_fk_extras_gi FOREIGN KEY (backup_repository_id) REFERENCES public.extras_gitrepository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_goldenconfig nautobot_golden_conf_device_id_2180ab89_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfig
    ADD CONSTRAINT nautobot_golden_conf_device_id_2180ab89_fk_dcim_devi FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_configcompliance nautobot_golden_conf_device_id_e79e9798_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configcompliance
    ADD CONSTRAINT nautobot_golden_conf_device_id_e79e9798_fk_dcim_devi FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_goldenconfigsetting nautobot_golden_conf_intended_repository__4dd88f85_fk_extras_gi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfigsetting
    ADD CONSTRAINT nautobot_golden_conf_intended_repository__4dd88f85_fk_extras_gi FOREIGN KEY (intended_repository_id) REFERENCES public.extras_gitrepository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_goldenconfigsetting nautobot_golden_conf_jinja_repository_id_1dad39a4_fk_extras_gi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfigsetting
    ADD CONSTRAINT nautobot_golden_conf_jinja_repository_id_1dad39a4_fk_extras_gi FOREIGN KEY (jinja_repository_id) REFERENCES public.extras_gitrepository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_configreplace nautobot_golden_conf_platform_id_46e5eda2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configreplace
    ADD CONSTRAINT nautobot_golden_conf_platform_id_46e5eda2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_configremove nautobot_golden_conf_platform_id_a230d573_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configremove
    ADD CONSTRAINT nautobot_golden_conf_platform_id_a230d573_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_configcompliance nautobot_golden_conf_rule_id_aad296a7_fk_nautobot_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_configcompliance
    ADD CONSTRAINT nautobot_golden_conf_rule_id_aad296a7_fk_nautobot_ FOREIGN KEY (rule_id) REFERENCES public.nautobot_golden_config_compliancerule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: nautobot_golden_config_goldenconfigsetting nautobot_golden_conf_sot_agg_query_id_fdaec944_fk_extras_gr; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.nautobot_golden_config_goldenconfigsetting
    ADD CONSTRAINT nautobot_golden_conf_sot_agg_query_id_fdaec944_fk_extras_gr FOREIGN KEY (sot_agg_query_id) REFERENCES public.extras_graphqlquery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t FOREIGN KEY (parent_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_contenttype_id_594b1cc7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_contenttype_id_594b1cc7_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermission_users_user_id_16c0905d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_user_id_16c0905d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_local_context_data_o_f760366b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_local_context_data_o_f760366b_fk_django_co FOREIGN KEY (local_context_data_owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_local_context_schema_d359876d_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_local_context_schema_d359876d_fk_extras_co FOREIGN KEY (local_context_schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_status_id_ff17be20_fk_extras_st; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_status_id_ff17be20_fk_extras_st FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vminterface_id_904b12de_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vminterface_id_904b12de_fk_virtualiz FOREIGN KEY (vminterface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--