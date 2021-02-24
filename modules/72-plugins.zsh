if [ -f /etc/os-release ]; then
    while IFS= read -r line; do
        var=$(echo "$line" | cut -d '=' -f 1)
        eval "unset $var"
    done < /etc/os-release
fi
