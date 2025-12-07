%global forgeurl https://github.com/DreamMaoMao/mangowc

Name:           mangowc
Version:        0.10.7
Release:        1%{?dist}
Summary:        Lightweight Wayland compositor with smooth animation

License:        GPL-3.0-or-later
URL:            %{forgeurl}

Source0:        %{forgeurl}/archive/refs/tags/%{version}/%{name}-%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  gcc-c++
BuildRequires:  meson
BuildRequires:  ninja-build
BuildRequires:  pkgconfig
BuildRequires:  wayland-devel
BuildRequires:  wayland-protocols-devel
BuildRequires:  wlroots-devel
BuildRequires:  libinput-devel
BuildRequires:  libdrm-devel
BuildRequires:  libxkbcommon-devel
BuildRequires:  pixman-devel
BuildRequires:  libseat-devel
BuildRequires:  pcre2-devel
BuildRequires:  scenefx-devel

Requires:       scenefx

%description
MangoWC is a lightweight Wayland compositor based on wlroots and SceneFX.

%prep
%setup -q -n %{name}-%{version}

%build
%meson -Dxwayland=enabled
%meson_build

%install
%meson_install

# Remove upstream-installed files we replace
rm -f %{buildroot}/etc/mango/config.conf || :
rm -f %{buildroot}%{_datadir}/wayland-sessions/mango.desktop || :

# Install session file (in repo root, not in data/)
install -Dm0644 mango.desktop \
    %{buildroot}%{_datadir}/wayland-sessions/mango.desktop

# Install config (also in repo root)
install -Dm0644 config.conf \
    %{buildroot}%{_sysconfdir}/mango/config.conf

%files
%license LICENSE*
%doc README.md
%{_bindir}/mango
%{_bindir}/mmsg
%{_datadir}/wayland-sessions/mango.desktop
%config(noreplace) %{_sysconfdir}/mango/config.conf

%changelog
* Sun dec 07 2025 Christian Bendiksen <christian@bendiksen.me> - 0.10.7-1
- Build from release 0.10.7
