$(document).ready(function(){
    $("#add").click(function(){

        var num=$(this).find(".code").val();
        var nam=$(this).find(".name").val();
        // $(".template:last-of-type").clone(true).appendTo("body");
        let html = $(".template:first-of-type").clone(true);
        $(html).attr('code',num);
        $(html).attr('name',nam);
        html.find("input:last").remove();
        html.find(".btnDiv").append(`
        <button onclick="confirm('确认删除吗?')" class="btn delete">删除</button>
        <input type="submit" class="btn keep" value="保存" >
    `);


        $("body").append(html);
        $(".delete").click(function(){
            $(this).parent().parent().parent().parent().remove();
        })
    });

});