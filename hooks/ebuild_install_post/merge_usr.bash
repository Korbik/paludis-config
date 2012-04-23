# vim: set sw=4 sts=4 et :

for dir in bin sbin lib lib32 lib64; do
    local slashdir="${IMAGE}"/${dir}/
    if [[ -d "${slashdir}" ]]; then
        local usrdir="${IMAGE}"/usr/${dir}/
        if [[ -d "${usrdir}" ]]; then
            pushd "${slashdir}"
            for f in *; do
                [[ ! -L "${f}" || ! -f "${usrdir}/${f}" ]] && mv "${f}" "${usrdir}" || rm "${f}"
            done
            popd
            rmdir "${slashdir}"
        else
            mv "${slashdir}" "${usrdir}"
        fi
    fi
done

local usrdir="${IMAGE}"/usr/etc/
if [[ -d "${usrdir}" ]]; then
    local slashdir="${IMAGE}"/etc/
    if [[ -d "${slashdir}" ]]; then
        pushd "${usrdir}"
        for f in *; do
            [[ ! -L "${f}" || ! -f "${slashdir}/${f}" ]] && mv "${f}" "${slashdir}" || rm "${f}"
        done
        popd
        rmdir "${usrdir}"
    else
        mv "${usrdir}" "${slashdir}"
    fi
fi