FROM go AS go-build
COPY . . 
RUN go get 
RUN go build -o /usr/bin/lvscare

FROM bitnami/minideb:bookworm
COPY --from=go-build /usr/bin/lvscare /usr/bin/lvscare
RUN install_packages ipvsadm kmod
CMD ["lvscare"]
