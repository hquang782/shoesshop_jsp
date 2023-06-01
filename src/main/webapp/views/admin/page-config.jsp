<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../common/taglib.jsp" %>
<style>
    .wrapper-editor .editor-item {
        margin-bottom: 20px;
        margin-top: 20px;
        padding: 12px;
        background-color: white;
        border-radius: 5px;
        border: 1px solid rgba(0, 0, 0, 0.1);
    }

    .editor-item h3 {
        margin: 0 0 8px 8px;
    }

    .editor-item #fr-logo {
        display: none !important;
    }

    .editor-item>button {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 20px;
        padding-right: 20px;
        background-color: rgb(155, 255, 162);
    }

</style>
<div id="main">
    <div class="content">
        <div class="box title-decorator--left">
            <div class="wrap-title">
                <div class="item-title">
                    <h3>Config</h3>
                </div>
                <div class="timer">
                    <p id="timer"></p>
                </div>
            </div>
        </div>

        <div class="wrapper-editor">
            <div class="editor-item">
                <h3>Config page policy</h3>
                <div class="editor" id="policy"></div>
                <button id="submitPolicy">Save</button>
            </div>

            <div class="editor-item">
                <h3>Config page about us</h3>
                <div class="editor" id="aboutUs"></div>
                <button id="submitAboutUs">Save</button>
            </div>

            <div class="editor-item">
                <h3>Config page store</h3>
                <div class="editor" id="store"></div>
                <button id="submitStore">Save</button>
            </div>
        </div>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/3.2.6/js/froala_editor.pkgd.min.js"></script>
<script>
    const editors = new FroalaEditor('.editor', {
        imageUploadURL: 'http://localhost:8080/admin/api/upload',
        heightMin: 150,
        events: {
            'image.uploaded': function (response) {
                let imageUrl = response.link
                this.image.insert(imageUrl)
            }
        }
    })
    const submitPolicy = document.getElementById('submitPolicy')
    submitPolicy.addEventListener('click', async () => {
        const body = JSON.stringify({ data: editors[0].html.get() })
        console.log(body);
        const res = await fetch(
            'https://localhost:8443/admin/api/config/policy',
            {
                method: 'POST',
                body: body
            }
        )
        console.log(res.json());
    })

    const submitAboutUs = document.getElementById('submitAboutUs')
    submitAboutUs.addEventListener('click', async () => {
        const body = JSON.stringify({ data: editors[1].html.get() })
        console.log(body);
        const res = await fetch(
            'https://localhost:8443/admin/api/config/about-us',
            {
                method: 'POST',
                body: body
            }
        )
        console.log(res.json());
    })

    const submitStore = document.getElementById('submitStore')
    submitStore.addEventListener('click', async () => {
        const body = JSON.stringify({ data: editors[2].html.get() })
        console.log(body);
        const res = await fetch(
            'https://localhost:8443/admin/api/config/store',
            {
                method: 'POST',
                body: body
            }
        )
        console.log(res.json());
    })
</script>