VERSION="v0.1.0"

# Function to display usage
usage() {
    echo "Usage: $0 <command> [options]"
    echo "Commands:"
    echo "  cpu getinfo        Get CPU information"
    echo "  memory getinfo     Get Memory information"
    echo "  user create <name> Create a new user"
    echo "  user list           List all regular users"
    echo "  user list --sudo-only List users with sudo permissions"
    echo "  file getinfo <file> Get file information"
    echo "Options:"
    echo "  --version          Show command version"
    echo "  --help             Show this help message"
    exit 1
}

# Function to get CPU information
get_cpu_info() {
    lscpu
}

# Function to get Memory information
get_memory_info() {
    free
}

# Function to create a new user
create_user() {
    if [ -z "$1" ]; then
        echo "Error: User name not provided."
    else
        useradd "$1"
        echo "User $1 created successfully."
    fi
}

# Function to list users
list_users() {
    getent passwd | cut -d: -f1
}

# Function to list users with sudo permissions
list_sudo_users() {
    grep -E 'sudo|wheel' /etc/sudoers | grep -v '#' | cut -d' ' -f1
}

# Function to get file information
get_file_info() {
    if [ -z "$1" ]; then
        echo "Error: File name not provided."
    else
        stat "$1"
    fi
}

# Parse command line arguments
case "$1" in
    "cpu" )
        case "$2" in
            "getinfo" )
                get_cpu_info
                ;;
            * )
                usage
                ;;
        esac
        ;;
    "memory" )
        case "$2" in
            "getinfo" )
                get_memory_info
                ;;
            * )
                usage
                ;;
        esac
        ;;
    "user" )
        case "$2" in
            "create" )
                create_user "$3"
                ;;
            "list" )
                if [ "$3" == "--sudo-only" ]; then
                    list_sudo_users
                else
                    list_users
                fi
                ;;
            * )
                usage
                ;;
        esac
        ;;
    "file" )
        case "$2" in
            "getinfo" )
                get_file_info "$3"
                ;;
            * )
                usage
                ;;
        esac
        ;;
    "--version" )
        echo "internsctl $VERSION"
        ;;
    "--help" | * )
        usage
        ;;
esac
