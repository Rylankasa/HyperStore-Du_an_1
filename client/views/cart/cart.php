<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/client/cart.css">
</head>

<body>
    <?php require_once "client/views/layout/header.php"; ?>

    <div class="cart-container">
        <h2>Giỏ hàng của bạn</h2>

        <?php if (empty($cart_items)): ?>
        <div class="empty-cart">
            <i class="fas fa-shopping-cart"></i>
            <p>Giỏ hàng trống</p>
            <a href="index.php?action=home" class="continue-shopping">Tiếp tục mua sắm</a>
        </div>
        <?php else: ?>
        <div class="cart-content">
            <div class="cart-items">
                <div class="select-all">
                    <label class="checkbox-wrapper">
                        <input type="checkbox" id="select-all">
                        <span class="checkmark"></span>
                        <span class="label-text">Chọn tất cả</span>
                    </label>
                </div>

                <div class="shop-header">
                    <span class="shop-name">
                        <i class="fas fa-store"></i>
                        HyperStore Official
                    </span>
                </div>

                <?php foreach ($cart_items as $item): ?>
                <div class="cart-item">
                    <label class="checkbox-wrapper">
                        <input type="checkbox" class="item-checkbox" data-product-id="<?php echo $item['pro_id']; ?>"
                            data-price="<?php echo isset($item['discounted_price']) ? $item['discounted_price'] : $item['final_price']; ?>"
                            data-quantity="<?php echo $item['quantity']; ?>">
                        <span class="checkmark"></span>
                    </label>

                    <div class="item-image">
                        <img src="Uploads/Product/<?php echo $item['img']; ?>" alt="<?php echo $item['pro_name']; ?>">
                        <?php if (isset($item['current_discount']) && $item['current_discount'] > 0): ?>
                        <div class="discount-badge">-<?php echo $item['current_discount']; ?>%</div>
                        <?php endif; ?>
                    </div>

                    <div class="item-info">
                        <h3><?php echo $item['pro_name']; ?></h3>

                        <div class="item-variants">
                            <?php if ($item['storage_type']): ?>
                            <span class="variant storage">
                                <i class="fas fa-memory"></i>
                                <?php echo $item['storage_type']; ?>
                                <?php if ($item['storage_price'] > 0): ?>
                                <span
                                    class="price-diff">+<?php echo number_format($item['storage_price'], 0, ',', '.'); ?>₫</span>
                                <?php endif; ?>
                            </span>
                            <?php endif; ?>

                            <?php if ($item['color_type']): ?>
                            <span class="variant color">
                                <i class="fas fa-palette"></i>
                                <?php echo $item['color_type']; ?>
                                <?php if ($item['color_price'] > 0): ?>
                                <span
                                    class="price-diff">+<?php echo number_format($item['color_price'], 0, ',', '.'); ?>₫</span>
                                <?php endif; ?>
                            </span>
                            <?php endif; ?>
                        </div>

                        <div class="price-section">
                            <?php if (isset($item['current_discount']) && $item['current_discount'] > 0): ?>
                            <span
                                class="original-price"><?php echo number_format($item['final_price'], 0, ',', '.'); ?>₫</span>
                            <span
                                class="discounted-price"><?php echo number_format($item['discounted_price'], 0, ',', '.'); ?>₫</span>
                            <?php else: ?>
                            <span
                                class="final-price"><?php echo number_format($item['final_price'], 0, ',', '.'); ?>₫</span>
                            <?php endif; ?>
                        </div>

                        <div class="item-actions">
                            <div class="quantity-controls">
                                <form action="index.php?action=update-quantity" method="POST">
                                    <input type="hidden" name="product_id" value="<?php echo $item['pro_id']; ?>">
                                    <button type="submit" name="quantity_action" value="decrease"
                                        class="qty-btn minus">-</button>
                                    <span class="quantity-display"><?php echo $item['quantity']; ?></span>
                                    <button type="submit" name="quantity_action" value="increase"
                                        class="qty-btn plus">+</button>
                                </form>
                            </div>

                            <div class="item-subtotal">
                                Tổng: <span><?php echo number_format($item['subtotal'], 0, ',', '.'); ?>đ</span>
                            </div>

                            <form action="index.php?action=remove-from-cart" method="POST" class="remove-form"
                                onsubmit="return confirmDelete()">
                                <input type="hidden" name="product_id" value="<?php echo $item['pro_id']; ?>">
                                <button type="submit" class="remove-btn">
                                    <i class="fas fa-trash"></i>
                                    <span>Xóa</span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>

            <div class="cart-summary">
                <div class="summary-details">
                    <div class="summary-row">
                        <span>Tạm tính (<span id="selected-count">0</span> sản phẩm):</span>
                        <span class="subtotal">0đ</span>
                    </div>
                    <div class="summary-row">
                        <span>Phí vận chuyển:</span>
                        <span>Miễn phí</span>
                    </div>
                    <div class="summary-total">
                        <span>Tổng thanh toán:</span>
                        <span class="total">0đ</span>
                    </div>
                </div>

                <form action="index.php?action=checkout" method="POST" id="checkout-form">
                    <!-- Các input hidden sẽ được thêm bằng JavaScript khi submit -->
                    <button type="submit" class="checkout-btn" id="checkout-selected" disabled>
                        Thanh toán (<span id="checkout-count">0</span> sản phẩm)
                    </button>
                </form>
            </div>
        </div>
        <?php endif; ?>
    </div>

    <?php require_once "client/views/layout/footer.php"; ?>

    <style>
    .cart-container {
        max-width: 1200px;
        margin: 30px auto;
        padding: 0 20px;
    }

    .cart-content {
        display: grid;
        grid-template-columns: 1fr 350px;
        gap: 30px;
    }

    .cart-item {
        display: flex;
        align-items: flex-start;
        padding: 20px;
        border: 1px solid #eee;
        margin-bottom: 15px;
        border-radius: 8px;
        background: #fff;
        gap: 20px;
    }

    .item-image {
        width: 120px;
        margin-right: 20px;
    }

    .item-image img {
        width: 100%;
        border-radius: 8px;
    }

    .item-info {
        flex: 1;
    }

    .item-specs {
        display: flex;
        gap: 15px;
        margin: 10px 0;
    }

    .spec {
        display: inline-flex;
        align-items: center;
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 0.9em;
        background: #f8f9fa;
    }

    .spec i {
        margin-right: 5px;
    }

    .spec.storage {
        background: #e3f2fd;
        color: #1976d2;
    }

    .spec.color {
        color: #fff;
        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
    }

    .item-price {
        font-size: 1.2em;
        font-weight: 600;
        color: #e74c3c;
    }

    .cart-summary {
        background: white;
        padding: 25px;
        border-radius: 15px;
        position: sticky;
        top: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
    }

    .summary-details {
        margin: 20px 0;
    }

    .summary-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        color: #666;
    }

    .summary-total {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        padding-top: 20px;
        border-top: 2px solid #f0f0f0;
        font-weight: bold;
        font-size: 1.2em;
    }

    .checkout-btn {
        width: 100%;
        padding: 15px;
        background: linear-gradient(45deg, #2ecc71, #27ae60);
        color: white;
        border: none;
        border-radius: 10px;
        font-weight: 600;
        width: 100%;
        margin-top: 20px;
        transition: transform 0.2s;
    }

    .checkout-btn:hover {
        transform: translateY(-2px);
    }

    .continue-shopping {
        display: block;
        text-align: center;
        margin-top: 15px;
        color: #666;
        text-decoration: none;
    }

    .empty-cart {
        text-align: center;
        padding: 50px 0;
    }

    .empty-cart i {
        font-size: 50px;
        color: #ddd;
        margin-bottom: 20px;
    }

    .quantity-controls {
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 15px 0;
    }

    .qty-btn {
        width: 30px;
        height: 30px;
        border: none;
        background: #f8f9fa;
        border-radius: 50%;
        cursor: pointer;
        font-size: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.2s;
    }

    .qty-btn:hover {
        background: #e9ecef;
    }

    .quantity-display {
        font-size: 16px;
        font-weight: 600;
        min-width: 40px;
        text-align: center;
    }

    .cart-summary {
        background: white;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .summary-details {
        margin: 20px 0;
    }

    .summary-row {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #eee;
    }

    .summary-total {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        padding-top: 15px;
        border-top: 2px solid #eee;
        font-size: 1.2em;
        font-weight: bold;
    }

    .checkout-btn {
        background: linear-gradient(45deg, #2ecc71, #27ae60);
        color: white;
        border: none;
        padding: 15px;
        border-radius: 10px;
        font-weight: 600;
        width: 100%;
        margin-top: 20px;
        transition: transform 0.2s;
    }

    .checkout-btn:hover {
        transform: translateY(-2px);
    }

    .checkbox-wrapper {
        display: inline-flex;
        align-items: center;
        cursor: pointer;
        margin-right: 10px;
    }

    .checkbox-wrapper input {
        display: none;
    }

    .checkmark {
        width: 20px;
        height: 20px;
        border: 2px solid #ee4d2d;
        border-radius: 4px;
        display: inline-block;
        position: relative;
        margin-right: 8px;
    }

    .checkbox-wrapper input:checked+.checkmark:after {
        content: '';
        position: absolute;
        left: 6px;
        top: 2px;
        width: 5px;
        height: 10px;
        border: solid #ee4d2d;
        border-width: 0 2px 2px 0;
        transform: rotate(45deg);
    }

    .shop-header {
        display: flex;
        align-items: center;
        padding: 15px;
        background: white;
        border-radius: 8px;
        margin-bottom: 10px;
    }

    .shop-name {
        font-weight: 600;
        margin-left: 8px;
    }

    .checkout-btn:disabled {
        background: #ccc;
        cursor: not-allowed;
    }

    .remove-btn {
        background: none;
        border: none;
        color: #666;
        cursor: pointer;
        padding: 8px 12px;
        border-radius: 4px;
        display: flex;
        align-items: center;
        gap: 6px;
        transition: all 0.3s ease;
    }

    .remove-btn:hover {
        background-color: #fff0f0;
        color: #e94560;
    }

    .remove-btn i {
        font-size: 14px;
    }

    .remove-btn span {
        font-size: 14px;
    }
    </style>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const selectAll = document.getElementById('select-all');
        const itemCheckboxes = document.querySelectorAll('.item-checkbox');
        const checkoutBtn = document.getElementById('checkout-selected');

        function updateSummary() {
            let totalPrice = 0;
            let selectedCount = 0;

            document.querySelectorAll('.item-checkbox:checked').forEach(checkbox => {
                const price = parseFloat(checkbox.dataset.price);
                const quantity = parseInt(checkbox.dataset.quantity);
                totalPrice += price * quantity;
                selectedCount += quantity;
            });

            document.querySelector('.subtotal').textContent =
                new Intl.NumberFormat('vi-VN').format(totalPrice) + 'đ';
            document.querySelector('.total').textContent =
                new Intl.NumberFormat('vi-VN').format(totalPrice) + 'đ';
            document.getElementById('selected-count').textContent = selectedCount;
            document.getElementById('checkout-count').textContent = selectedCount;

            // Enable/disable checkout button
            document.getElementById('checkout-selected').disabled = selectedCount === 0;
        }

        // Select all functionality
        selectAll.addEventListener('change', function() {
            itemCheckboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
            updateSummary();
        });

        // Individual item checkboxes
        itemCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                updateSummary();
            });
        });

        // Checkout button click
        checkoutBtn.addEventListener('click', function() {
            const selectedProducts = Array.from(itemCheckboxes)
                .filter(cb => cb.checked)
                .map(cb => cb.dataset.productId);

            if (selectedProducts.length > 0) {
                // Tạo form ẩn để submit
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'index.php?action=checkout';

                // Thêm các sản phẩm đã chọn vào form
                selectedProducts.forEach(productId => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'selected_products[]';
                    input.value = productId;
                    form.appendChild(input);
                });

                document.body.appendChild(form);
                form.submit();
            }
        });
    });

    document.getElementById('checkout-selected').addEventListener('click', function(e) {
        e.preventDefault();

        const selectedCheckboxes = document.querySelectorAll('.item-checkbox:checked');
        if (selectedCheckboxes.length === 0) {
            alert('Vui lòng chọn ít nhất một sản phẩm');
            return;
        }

        const form = document.getElementById('checkout-form');

        // Thêm input cho các sản phẩm được chọn
        selectedCheckboxes.forEach(checkbox => {
            const productId = checkbox.getAttribute('data-product-id');
            const quantity = checkbox.getAttribute('data-quantity');

            // Input cho selected products
            const productInput = document.createElement('input');
            productInput.type = 'hidden';
            productInput.name = 'selected_products[]';
            productInput.value = productId;
            form.appendChild(productInput);

            // Input cho số lượng
            const quantityInput = document.createElement('input');
            quantityInput.type = 'hidden';
            quantityInput.name = `quantities[${productId}]`;
            quantityInput.value = quantity;
            form.appendChild(quantityInput);
        });

        form.submit();
    });

    // Cập nhật các event listeners khác
    document.querySelectorAll('.item-checkbox').forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            const selectedCount = document.querySelectorAll('.item-checkbox:checked').length;
            const checkoutBtn = document.getElementById('checkout-selected');

            // Cập nhật số lượng sản phẩm đã chọn
            document.getElementById('checkout-count').textContent = selectedCount;
            document.getElementById('selected-count').textContent = selectedCount;

            // Enable/disable nút thanh toán
            checkoutBtn.disabled = selectedCount === 0;

            // Cập nhật tổng tiền
            updateSummary();
        });
    });

    // Xử lý nút tăng giảm số lượng
    document.querySelectorAll('.qty-btn').forEach(button => {
        button.addEventListener('click', function() {
            const productId = this.getAttribute('data-id');
            const action = this.classList.contains('plus') ? 'increase' : 'decrease';

            // Tạo form để submit
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'index.php?action=update-quantity';

            // Input cho product_id
            const productInput = document.createElement('input');
            productInput.type = 'hidden';
            productInput.name = 'product_id';
            productInput.value = productId;
            form.appendChild(productInput);

            // Input cho action (tăng/giảm)
            const actionInput = document.createElement('input');
            actionInput.type = 'hidden';
            actionInput.name = 'quantity_action';
            actionInput.value = action;
            form.appendChild(actionInput);

            // Submit form
            document.body.appendChild(form);
            form.submit();
        });
    });

    function confirmDelete() {
        return confirm('Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?');
    }

    document.querySelectorAll('.item-checkbox').forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            const productId = this.dataset.productId;
            const quantity = this.dataset.quantity;
            const quantityInput = document.querySelector(
                `.product-quantity[data-product-id="${productId}"]`);

            if (this.checked && quantityInput) {
                quantityInput.disabled = false;
            } else if (quantityInput) {
                quantityInput.disabled = true;
            }

            updateCheckoutSummary();
        });
    });

    function updateCheckoutSummary() {
        const selectedCheckboxes = document.querySelectorAll('.item-checkbox:checked');
        const checkoutCount = document.getElementById('checkout-count');
        let totalQuantity = 0;

        selectedCheckboxes.forEach(checkbox => {
            totalQuantity += parseInt(checkbox.dataset.quantity);
        });

        checkoutCount.textContent = totalQuantity;
        document.getElementById('checkout-selected').disabled = totalQuantity === 0;
    }
    </script>
</body>

</html>