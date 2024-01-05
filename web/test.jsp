<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkbox Selection in JSP</title>
</head>
<body>
    <p>Chọn các checkbox để thêm vào danh sách:</p>

    <!-- Danh sách checkbox -->
    <input type="checkbox" id="checkbox1" value="Giá trị 1"> Checkbox 1<br>
    <input type="checkbox" id="checkbox2" value="Giá trị 2"> Checkbox 2<br>
    <input type="checkbox" id="checkbox3" value="Giá trị 3"> Checkbox 3<br>

    <p>Danh sách các giá trị đã chọn: <span id="selectedValues"></span></p>

    <script>
        const checkboxes = document.querySelectorAll("input[type=checkbox]");
        const selectedValuesSpan = document.getElementById("selectedValues");
        let selectedValues = "";

        checkboxes.forEach(checkbox => {
            checkbox.addEventListener("change", function() {
                if (this.checked) {
                    // Nếu checkbox được chọn, thêm giá trị vào chuỗi
                    selectedValues += this.value + " ";
                } else {
                    // Nếu checkbox bị bỏ chọn, loại bỏ giá trị khỏi chuỗi
                    const valueToRemove = this.value + " ";
                    selectedValues = selectedValues.replace(valueToRemove, "");
                }
                // Cập nhật hiển thị chuỗi
                selectedValuesSpan.textContent = selectedValues;
            });
        });
    </script>
</body>
</html>
