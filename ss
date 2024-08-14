{
  "log": {
    "disabled": true,
    "level": "fatal",
    "timestamp": true
  },
  "dns": {
    "servers": [
      {
        "tag": "dns-remote",
        "address": "udp://94.140.14.14",
        "strategy": "prefer_ipv4",
        "detour": "✨"
      },
      {
        "tag": "dns-local",
        "address": "udp://8.8.8.8",
        "detour": "direct"
      },
      {
        "tag": "dns-resolver",
        "address": "178.22.122.100",
        "detour": "direct"
      },
      {
        "tag": "dns-locale",
        "address": "https://dns.403.online/dns-query",
        "address_resolver": "dns-locale-resolver",
        "detour": "direct"
      },
      {
        "tag": "dns-locale-resolver",
        "address": "10.202.10.202",
        "detour": "direct"
      },
      {
        "tag": "dns-block",
        "address": "rcode://success"
      }
    ],
    "rules": [
      {
        "domain": [
          "guixgnu.com"
        ],
        "server": "dns-locale"
      },
      {
        "outbound": "auto",
        "server": "dns-locale"
      },
      {
        "outbound": "any",
        "server": "dns-local"
      },
      {
        "domain_suffix": ".ir",
        "server": "dns-local"
      }
    ],
    "final": "dns-remote",
    "reverse_mapping": true,
    "disable_cache": true
  },
  "inbounds": [
    {
      "type": "tun",
      "tag": "tun-in",
      "interface_name": "tun0",
      "mtu": 9000,
      "inet4_address": "172.19.0.1/30",
      "inet4_route_exclude_address": [
        "192.168.0.0/16"
      ],
      "inet6_route_exclude_address": [
        "fc00::/7"
      ],
      "auto_route": true,
      "strict_route": true,
      "stack": "mixed",
      "sniff": true,
      "sniff_override_destination": false
    }
  ],
  "outbounds": [
    {
      "type": "direct",
      "tag": "direct"
    },
    {
      "type": "block",
      "tag": "block"
    },
    {
      "type": "dns",
      "tag": "dns-out"
    },
    {
      "server": "series-a2-me.varzesh360.co",
      "server_port": 443,
      "password": "Bog0ELmMM9DSxDdQ",
      "method": "chacha20-ietf-poly1305",
      "tag": "1",
      "type": "shadowsocks"
    },
    {
      "server": "series-a2-me.samanehha.co",
      "server_port": 443,
      "password": "Bog0ELmMM9DSxDdQ",
      "method": "chacha20-ietf-poly1305",
      "tag": "2",
      "type": "shadowsocks"
    },
    {
      "server": "series-a2-mec.varzesh360.co",
      "server_port": 443,
      "password": "u17T3BvpYaaiuW2c",
      "method": "chacha20-ietf-poly1305",
      "tag": "3",
      "type": "shadowsocks"
    },
    {
      "server": "series-a2.varzesh360.co",
      "server_port": 443,
      "password": "mps3FwmDjLrWaOVg",
      "method": "chacha20-ietf-poly1305",
      "tag": "4",
      "type": "shadowsocks"
    },
    {
      "server": "series-a2.samanehha.co",
      "server_port": 443,
      "password": "mps3FwmDjLrWaOVg",
      "method": "chacha20-ietf-poly1305",
      "tag": "5",
      "type": "shadowsocks"
    },
    {
      "type": "selector",
      "tag": "✨",
      "interrupt_exist_connections": true,
      "outbounds": [
        "1",
        "2",
        "3",
        "4",
        "5"
      ]
    }
  ],
  "route": {
    "rules": [
      {
        "protocol": "dns",
        "outbound": "dns-out"
      },
      {
        "domain_suffix": [
          ".ir",
          "aparat.com",
          "digikala.com",
          "telewebion.com",
          "varzesh3.com"
        ],
        "outbound": "direct"
      },
      {
        "ip_is_private": true,
        "outbound": "direct"
      },
      {
        "source_ip_cidr": [
          "224.0.0.0/3",
          "ff00::/8"
        ],
        "ip_cidr": [
          "224.0.0.0/3",
          "ff00::/8"
        ],
        "outbound": "block"
      }
    ],
    "final": "✨",
    "auto_detect_interface": true,
    "override_android_vpn": true
  }
}
